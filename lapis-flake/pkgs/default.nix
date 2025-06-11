{ pkgs, luaPackages }:
let
  date = import ./date.nix { inherit pkgs luaPackages; };
  etlua = import ./etlua.nix { inherit pkgs luaPackages; };
  pgmoon = import ./pgmoon.nix { inherit pkgs luaPackages; };
  lapis = import ./lapis.nix {
    inherit pkgs luaPackages;
    inherit date etlua pgmoon;
  };
in
{
  inherit
    lapis
    date
    etlua
    pgmoon
    ;
}
