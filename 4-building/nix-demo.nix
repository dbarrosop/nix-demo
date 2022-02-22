{ buildGoModule
, pkgs
, lib
, name
, version
}:


buildGoModule {
  pname = name;
  version = version;

  src = ../src;
  vendorSha256 = null;

  buildInputs = [ pkgs.vips ];

  nativeBuildInputs = [ pkgs.go pkgs.pkg-config ];

  meta = {
    description = "NIX is awesome";
    homepage = "https://github.com/dbarrosop/nix-demo";
    license = lib.licenses.mit;
    maintainers = [ "@dbarrosop" ];
    platforms = lib.platforms.linux ++ lib.platforms.darwin;
  };
}

