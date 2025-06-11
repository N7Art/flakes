{
  buildLuarocksPackage,
  fetchFromGitHub,
  fetchurl,
  lpeg,
  luaOlder,
}:
buildLuarocksPackage {
  pname = "pgmoon";
  version = "1.16.0-1";
  knownRockspec =
    (fetchurl {
      url = "mirror://luarocks/pgmoon-1.16.0-1.rockspec";
      sha256 = "0qibc6pbal0n5p7c0v0rxrc2b3qdkbbz5wpn4nihsv7vkhjaqhx8";
    }).outPath;
  src = fetchFromGitHub {
    owner = "leafo";
    repo = "pgmoon";
    rev = "v1.16.0";
    hash = "sha256-DM13KW60XW+YGxrLs1JFPq9nzDCpyGvQnnNDA0xJ9aE=";
  };

  disabled = luaOlder "5.1";
  propagatedBuildInputs = [ lpeg ];

  meta = {
    homepage = "https://github.com/leafo/pgmoon";
    description = "Postgres driver for OpenResty and Lua";
    license.fullName = "MIT";
  };
}
