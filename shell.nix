let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
  cargo
  stylua
  lua-language-server
  fd
  ripgrep
  pre-commit
  selene
  luajitPackages.luacheck
  nodejs
  ];
}
