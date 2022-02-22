final: prev: rec {
  lua = final.lua5_4;

  luarocks = (
    prev.luarocks.override { }
  ).overrideAttrs
    (
      oldAttrs: rec {
        name = "luarocks";
        version = "3.8.0";

        patches = [ ]; # we remove some patches that don't work here

        src = prev.fetchFromGitHub {
          owner = "luarocks";
          repo = "luarocks";
          rev = "v${version}";
          sha256 = "sha256-tPSAtveOodF2w54d82hEyaTj91imtySJUTsk/gje2dQ=";
        };
      }
    );
}
