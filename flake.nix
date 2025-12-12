{
  description = "fkoehler's neovim configuration";

  inputs = {
    systems.url = "github:nix-systems/default";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    git-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs =
    { self, ... }@inputs:
    let
      forEachSystem =
        f:
        inputs.nixpkgs.lib.genAttrs (import inputs.systems) (
          system:
          f {
            inherit system;
            pkgs = import inputs.nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
          }
        );
    in
    {
      devShells = forEachSystem (
        { pkgs, system }:
        let
          inherit (self.checks.${system}) pre-commit-check;
        in
        {
          default = pkgs.mkShellNoCC {
            packages = with pkgs; [
            ];

            env = { };

            inherit (pre-commit-check) shellHook;
          };
        }
      );

      formatter = forEachSystem (
        { pkgs, system }:
        let
          inherit (self.checks.${system}) pre-commit-check;
          script = ''
            ${pre-commit-check.config.package}/bin/pre-commit run --all-files --config ${pre-commit-check.config.configFile}
          '';
        in
        pkgs.writeShellScriptBin "pre-commit-run" script
      );
      checks = forEachSystem (
        { system, ... }:
        {
          pre-commit-check = inputs.git-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              # nix
              deadnix.enable = true;
              flake-checker.enable = true;
              nil.enable = true;
              nixfmt-rfc-style.enable = true;
              statix.enable = true;

              # lua
              selene.enable = true;
              stylua.enable = true;
            };
          };
        }
      );
      packages = forEachSystem (
        { pkgs, ... }:
        {
          default = pkgs.callPackage ./default.nix { };
          neovim-config = pkgs.callPackage ./default.nix { };
        }
      );
    };
}
