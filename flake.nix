{
  description = "Keebord :3";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux"  ];

      perSystem = { pkgs, ... }: {
        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShellNoCC {
            nativeBuildInputs = [
                pkgs.qmk
                pkgs.dfu-util
            ];
        };
      };
    };
}
