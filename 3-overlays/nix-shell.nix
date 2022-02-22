with (import (fetchTarball https://github.com/nixos/nixpkgs/archive/nixpkgs-unstable.tar.gz) {
  overlays = [ (import ./overlay.nix) ];
});
mkShell {
  buildInputs = [
    lua
    luarocks
  ];
}
