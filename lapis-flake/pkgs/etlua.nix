{
  buildLuarocksPackage,
  fetchFromGitHub,
  fetchurl,
  luaOlder,
}:
buildLuarocksPackage {
  pname = "etlua";
  version = "1.3.0-1";
  knownRockspec =
    (fetchurl {
      url = "mirror://luarocks/etlua-1.3.0-1.rockspec";
      sha256 = "1g98ibp7n2p4js39din2balncjnxxdbaq6msw92z072s2cccx9cf";
    }).outPath;
  src = fetchFromGitHub {
    owner = "leafo";
    repo = "etlua";
    rev = "v1.3.0";
    hash = "sha256-CVCNeivP6tefUMseoZjiO5wMYBEPNWMy2+0KnmEIuT0=";
  };

  disabled = luaOlder "5.1";

  meta = {
    homepage = "https://github.com/leafo/etlua";
    description = "Embedded templates for Lua";
    license.fullName = "MIT";
  };
}
