{ haskellPackages ? (import <nixpkgs> {}).haskellPackages }:
(haskellPackages.callPackage ./default.nix {}).env
