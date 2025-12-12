{ stdenvNoCC, ... }:
stdenvNoCC.mkDerivation {
  pname = "neovim-config";
  version = "1.0";

  src = ./.;

  installPhase = ''
    mkdir -p $out
    cp -r ./* $out/
  '';
}
