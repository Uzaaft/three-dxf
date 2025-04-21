{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import (inputs.nixpkgs) {inherit system;};
      in {
        devShell = pkgs.mkShell {
          packages = [pkgs.vtsls];
          buildInputs = [
            pkgs.nodejs_18
            pkgs.nodePackages.pnpm
            pkgs.nodePackages.typescript
          ];
        };
      }
    );
}
