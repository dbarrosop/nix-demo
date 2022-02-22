{
  description = "nix demo";

  # external dependencies, they will be locked
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    nix-filter.url = "github:numtide/nix-filter";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, nix-filter }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        name = "nix-demo";
        version = "0.1.0";

        overlays = [ (import ./overlay.nix) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };

        go-src = ./../src;

        nix-src = nix-filter.lib.filter {
          root = ./..;
          include = [
            (nix-filter.lib.matchExt "nix")
          ];
        };

        buildInputs = with pkgs; [
          vips
        ];

        nativeBuildInputs = with pkgs; [
          go
          clang
          pkg-config
        ];
      in
      {

        # nix flake check
        checks = {
          nixpkgs-fmt = pkgs.runCommand "check-nixpkgs-fmt"
            {
              nativeBuildInputs = with pkgs; [
                nixpkgs-fmt
              ];
            }
            ''
              mkdir $out
              nixpkgs-fmt --check ${nix-src}
            '';

          golangci-lint = pkgs.runCommand "golangci-lint"
            {
              nativeBuildInputs = with pkgs; [
                golangci-lint
              ] ++ buildInputs ++ nativeBuildInputs;
            }
            ''
              export GOLANGCI_LINT_CACHE=$TMPDIR/.cache/golangci-lint
              export GOCACHE=$TMPDIR/.cache/go-build
              export GOMODCACHE="$TMPDIR/.cache/mod"

              mkdir $out
              cd $out
              cp -r ${go-src}/* .

              golangci-lint run \
                --timeout 300s
            '';

          gotests = pkgs.runCommand "gotests"
            {
              nativeBuildInputs = with pkgs; [
              ] ++ buildInputs ++ nativeBuildInputs;
            }
            ''
              export GOCACHE=$TMPDIR/.cache/go-build
              export GOMODCACHE="$TMPDIR/.cache/mod"

              mkdir $out
              cd $out
              cp -r ${go-src}/* .

              go test \
                -v ./...
            '';

        };

        # nix develop
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            nixpkgs-fmt
            golangci-lint
          ] ++ buildInputs ++ nativeBuildInputs;
        };

        packages = flake-utils.lib.flattenTree
          {
            # nix build .#docker-image
            nix-demo = pkgs.callPackage ./nix-demo.nix {
              name = name;
              version = version;
              src = go-src;
            };

            # nix build .#docker-image
            docker-image = pkgs.dockerTools.buildImage {
              name = "nix-demo";
              tag = version;
              created = "now";

              config = {
                Env = [
                  "TMPDIR=${self.packages.${system}.nix-demo}/tmp"
                ];
                Entrypoint = [
                  "${self.packages.${system}.nix-demo}/bin/nix-demo"
                ];
              };
            };

          };

        # Executed by `nix build`
        defaultPackage = self.packages.${system}.nix-demo;

        apps = flake-utils.lib.flattenTree
          {
            # nix run .#nix-demo
            nix-demo = self.packages.${system}.nix-demo;
            # nix run .#golangci-lint
            golangci-lint = pkgs.golangci-lint;
            # nix run .#go
            go = pkgs.go;
          };

        # nix run
        defaultApp = self.packages.${system}.nix-demo;
      }


    );

}

