{ pkgs ? import <nixpkgs> {}, haskellPackages ? pkgs.haskellPackages }:
with pkgs.haskellPackages; haskellPackages.mkDerivation {
  pname = "FractalArt";
  version = "0.2.0.3";
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base directory filepath JuicyPixels mwc-random primitive random
    vector
  ];
  executableSystemDepends = with pkgs; [ xorg.libX11 ];
  homepage = "https://github.com/TomSmeets/FractalArt";
  description = "Generates colorful wallpapers";
  license = stdenv.lib.licenses.mit;
}
