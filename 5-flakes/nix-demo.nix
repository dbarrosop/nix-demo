{ buildGoModule
, pkgs
, lib
, name
, version
, src
}:


buildGoModule {
  pname = name;
  version = version;

  src = ../src;
  vendorSha256 = "sha256-ML2y1O92rGvEx5DgtVmtR3zyHCrvlgxMy3cmh+9wJKI=";

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
