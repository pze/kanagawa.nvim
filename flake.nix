{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };
  outputs = {nixpkgs, ...}: let
    pkgs = nixpkgs.legacyPackages.x86_64-darwin;
  in {
    devShells.x86_64-darwin.default = pkgs.mkShell {
      packages = [
        (pkgs.python311.withPackages (ps: [
          ps.numpy
          ps.matplotlib
          ps.scikit-image
          ps.scikit-learn
        ]))
      ];
    };
  };
}
