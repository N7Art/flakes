{
  buildLuarocksPackage,
  fetchFromGitHub,
  fetchurl,
  luaAtLeast,
  luaOlder,
}:
buildLuarocksPackage {
  pname = "date";
  version = "2.2.1-1";
  knownRockspec =
    (fetchurl {
      url = "mirror://luarocks/date-2.2.1-1.rockspec";
      sha256 = "0yksq18pmsczf8w3n3qdircyk1sy1dmcfkf2nszrsx44sw27y94a";
    }).outPath;
  src = fetchFromGitHub {
    owner = "Tieske";
    repo = "date";
    rev = "version_2.2.1";
    hash = "sha256-P+blk1/M8hc9rWkF4UTDEoRZQPUY3XNmgXuF9Pes2KI=";
  };

  disabled = luaOlder "5.0" || luaAtLeast "5.5";

  meta = {
    homepage = "https://github.com/Tieske/date";
    description = "Date & Time module for Lua 5.x";
    license.fullName = "MIT";
  };
}
