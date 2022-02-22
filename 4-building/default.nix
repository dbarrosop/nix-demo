let
  overlay = final: prev: rec {
    vips = (
      prev.vips.override { }
    ).overrideAttrs (
      oldAttrs: rec {
        version = "8.12.6";

        src = final.fetchFromGitHub {
          owner = "libvips";
          repo = "libvips";
          rev = "v${version}";
          sha256 = "sha256-Zo1Y4pYa+o55+ASrAiDUO7SAC4zpcAniEKkTFvIoU6o=";
          # Remove unicode file names which leads to different checksums on HFS+
          # vs. other filesystems because of unicode normalisation.
          extraPostFetch = ''
            rm -r $out/test/test-suite/images/
          '';
        };
      }
    );
  };
in
with (
  import (fetchTarball https://github.com/nixos/nixpkgs/archive/master.tar.gz) {
    overlays = [ overlay ];
  }
);
callPackage ./nix-demo.nix {
  name = "nix-demo";
  version = "0.1.0";
}
