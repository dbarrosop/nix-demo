final: prev: rec {
  go = final.go_1_17;

  golangci-lint = prev.golangci-lint.override rec {
    buildGoModule = args: prev.buildGoModule.override { go = go; } (args // rec {
      version = "1.43.0";
      src = prev.fetchFromGitHub {
        owner = "golangci";
        repo = "golangci-lint";
        rev = "v${version}";
        sha256 = "sha256-8aIKFLP1x9B5IMuyQ12LLIq79of4XwCdmDwae4T5MPg=";
      };
      vendorSha256 = "sha256-Mxy9VFBwcxyQtnhwuOFWK+0y0pQQDdqtoj0e2UXEo5k=";
      ldflags = [
        "-s"
        "-w"
        "-X main.version=${version}"
        "-X main.commit=v${version}"
        "-X main.date=19700101-00:00:00"
      ];
    });
  };

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
}
