{
  ansicolors,
  argparse,
  buildLuarocksPackage,
  date,
  etlua,
  fetchFromGitHub,
  fetchurl,
  loadkit,
  lpeg,
  lua-cjson,
  luaossl,
  luasocket,
  pgmoon,
}:
buildLuarocksPackage {
  pname = "lapis";
  version = "1.16.0-1";
  knownRockspec =
    (fetchurl {
      url = "mirror://luarocks/lapis-1.16.0-1.rockspec";
      sha256 = "0rqq02kpqawhpwii8i4vziv0cfc9ifz8w8pgi19wf8d0p3yhczig";
    }).outPath;
  src = fetchFromGitHub {
    owner = "leafo";
    repo = "lapis";
    rev = "v1.16.0";
    hash = "sha256-DGna/TTbE5DmVX9LoEXY2gRE2DLjyPWCc+BicQcRkqw=";
  };

  propagatedBuildInputs = [
    ansicolors
    argparse
    date
    etlua
    loadkit
    lpeg
    lua-cjson
    luaossl
    luasocket
    pgmoon
  ];

  meta = {
    homepage = "http://leafo.net/lapis";
    description = "A web framework for MoonScript & Lua";
    license.fullName = "MIT";
  };
}
