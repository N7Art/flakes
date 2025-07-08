{
  buildLuarocksPackage,
  ansicolors,
  argparse,
  loadkit,
  lpeg,
  lua-cjson,
  luaossl,
  luasocket,

  luaAtLeast,
  luaOlder,
  fetchFromGitHub,
  fetchurl,
}@inputs:
let

  date = import ./date.nix {
    inherit (inputs)
      buildLuarocksPackage
      luaAtLeast
      luaOlder
      fetchurl
      fetchFromGitHub
      ;
  };

  etlua = import ./etlua.nix {
    inherit (inputs)
      buildLuarocksPackage
      luaOlder
      fetchurl
      fetchFromGitHub
      ;
  };
  pgmoon = import ./pgmoon.nix {
    inherit (inputs)
      buildLuarocksPackage
      lpeg
      luaOlder
      fetchurl
      fetchFromGitHub
      ;
  };

  lapis = import ./lapis.nix {
    inherit (inputs)
      buildLuarocksPackage
      ansicolors
      argparse
      loadkit
      lpeg
      lua-cjson
      luaossl
      luasocket
      fetchurl
      fetchFromGitHub
      ;

    etlua = etlua;
    pgmoon = pgmoon;
    date = date;
  };
in
{
  inherit
    lapis
    etlua
    date
    ;
}
