{ pkgs ? import <nixpkgs> {}, haskellPackages ? pkgs.haskellPackages }:
with pkgs.haskellPackages; haskellPackages.mkDerivation {
  pname = "FractalArt";
  src = ./.;
  version = "0.2.0.4";
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base directory filepath JuicyPixels mwc-random primitive random
    vector
  ];
  executableSystemDepends = with pkgs; [ xorg.libX11 zlib ];
  homepage = "https://github.com/TomSmeets/FractalArt";
  description = "Generates colorful wallpapers";
  license = stdenv.lib.licenses.mit;
}
