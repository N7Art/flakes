{
  description = "Lapis flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        luaPackages = pkgs.lua51Packages;

        lapisPackages = import ./pkgs {
          inherit (luaPackages)
            buildLuarocksPackage
            ansicolors
            argparse
            loadkit
            lpeg
            lua-cjson
            luaossl
            luasocket
            luaOlder
            luaAtLeast;
          inherit (pkgs) fetchurl fetchFromGitHub;
        };
      in {
        packages.lapis = lapisPackages.lapis;
        packages.default = lapisPackages.lapis;

        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.luarocks-nix
            lapisPackages.lapis
            pkgs.openresty
          ];
        };
      });
}
