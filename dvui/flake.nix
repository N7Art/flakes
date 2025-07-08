{
  description = "dvui flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    raylib-flake.url = "github:N7Art/flakes?dir=raylib";
  };
  outputs =
    {
      self,
      nixpkgs,
      raylib-flake,
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      deps = raylib-flake.raylibDeps;
      devShell = pkgs.mkShell {
        buildInputs = deps ++ [pkgs.zig];
        

      };

    in
    {

      devShells.${system}.default = devShell;

      packages.${system}.default = devShell;

      devShell = devShell;
    };
}
