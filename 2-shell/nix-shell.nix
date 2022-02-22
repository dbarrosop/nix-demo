with (import (fetchTarball https://github.com/nixos/nixpkgs/archive/nixpkgs-unstable.tar.gz) { });
mkShell {
  buildInputs = [
    lua
    luarocks
  ];
  shellHook = ''
    echo
    echo ">>>>>> doing import stuff that needs done"
    export SOME_EXTREMELY_IMPORTANT_ENV_VAR="true"
  '';
}

