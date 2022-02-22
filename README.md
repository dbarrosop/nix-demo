# nix demo

Disclaimer; this is a teaser, lots of handwaving ahead

## What is nix

Nix is two things:
1. A package manager
1. A language used to define how to build software

### nix: the package manager

1. instead of packaged binaries you get instructions on how to build software
2. not globally installed
3. nix-store
4. nix manipulates the environment to make software/libraries available
5. multiple versions of the same software/libraries supported
6. channels are equivalent to "repositories"

### nix: the expression language

> The Nix expression language is a pure, lazy, functional language

1. domain specific
1. used to build software
1. overrides/overlays are powerful features that help you build on top of existing packages

## Installing packages

nix can be used as a package manager:

```
nix-demo on  master [✘!+?]
❯ lua -v
zsh: command not found: lua
nix-demo on  master [✘!+?]
❯ nix-env -iA nixpkgs.lua nixpkgs.luarocks
warning: Nix search path entry '/nix/var/nix/profiles/per-user/root/channels' does not exist, ignoring
installing 'lua-5.2.4'
installing 'luarocks-3.2.1'
these 10 paths will be fetched (8.03 MiB download, 38.42 MiB unpacked):
  /nix/store/0a72m9giai0k8kyhcbdhngc5r9yzvbhl-rhash-1.4.2
  /nix/store/4l8r0d3hjnzmpprvln1b4cangkwyzgmc-adv_cmds-119-ps
  /nix/store/619rsn4zhfisf9dxz953yqj4kfa1l63x-zip-3.0
  /nix/store/c4av2xl09m0r632wr59fjbbgw65ycvhm-lua-5.2.4
  /nix/store/m7dh0vdcdsv7x8j282rlay892gygc4my-cmake-3.22.2
  /nix/store/p4gy7ny5d353blv3pwwj86v1xa94ny2f-luarocks-3.2.1
  /nix/store/q7k84hdvamf7346105lischd59s3jq0f-lua-5.2.4
  /nix/store/qxw9p694wd4gy3gjfiqn31cxgh43p204-unzip-6.0
  /nix/store/vh8zl1jyn0gx82imfhnbph4qf33l1m5w-ps-adv_cmds-119
  /nix/store/x1qmyfwj93z3vqasxbcdnl6a170nblpp-curl-7.81.0
copying path '/nix/store/c4av2xl09m0r632wr59fjbbgw65ycvhm-lua-5.2.4' from 'https://cache.nixos.org'...
copying path '/nix/store/q7k84hdvamf7346105lischd59s3jq0f-lua-5.2.4' from 'https://cache.nixos.org'...
copying path '/nix/store/qxw9p694wd4gy3gjfiqn31cxgh43p204-unzip-6.0' from 'https://cache.nixos.org'...
copying path '/nix/store/619rsn4zhfisf9dxz953yqj4kfa1l63x-zip-3.0' from 'https://cache.nixos.org'...
copying path '/nix/store/4l8r0d3hjnzmpprvln1b4cangkwyzgmc-adv_cmds-119-ps' from 'https://cache.nixos.org'...
copying path '/nix/store/x1qmyfwj93z3vqasxbcdnl6a170nblpp-curl-7.81.0' from 'https://cache.nixos.org'...
copying path '/nix/store/0a72m9giai0k8kyhcbdhngc5r9yzvbhl-rhash-1.4.2' from 'https://cache.nixos.org'...
copying path '/nix/store/vh8zl1jyn0gx82imfhnbph4qf33l1m5w-ps-adv_cmds-119' from 'https://cache.nixos.org'...
copying path '/nix/store/m7dh0vdcdsv7x8j282rlay892gygc4my-cmake-3.22.2' from 'https://cache.nixos.org'...
copying path '/nix/store/p4gy7ny5d353blv3pwwj86v1xa94ny2f-luarocks-3.2.1' from 'https://cache.nixos.org'...
building '/nix/store/n7qmydvrg38fbisdf8qv4hyf54w7ihj0-user-environment.drv'...
nix-demo on  master [✘!+?] took 2s
❯ lua -v
Lua 5.2.4  Copyright (C) 1994-2015 Lua.org, PUC-Rio
nix-demo on  master [✘!+?]
❯ luarocks --version
/nix/store/p4gy7ny5d353blv3pwwj86v1xa94ny2f-luarocks-3.2.1/bin/.luarocks-wrapped 3.2.1
LuaRocks main command-line interface
```

## Managing a shell environment

You can create a shell environment with env vars pre-set and with specific software and libraries installed, etc.

See [2-shell/](2-shell/)

```
nix-demo on  master [✘!+?] took 17s
❯ nix-shell 2-shell/nix-shell.nix
warning: Nix search path entry '/nix/var/nix/profiles/per-user/root/channels' does not exist, ignoring
these 13 paths will be fetched (1.45 MiB download, 8.63 MiB unpacked):
  /nix/store/03ssh45d6wfjf965mifa2l4j6c3fvl3j-hook
  /nix/store/0m5iyhkjpgqf608k7lwy4hwdq786vd7n-gnutar-1.34
  /nix/store/0qlq4s175mzlx9g0aqcdk95j92g1z7mf-stdenv-darwin
  /nix/store/6d1ly7hvmpgghgkdpck82hykyw9miihx-gnu-config-2021-01-25
  /nix/store/aga0m55fspj4njaxbgjxxz2xxf7l48lr-bash-interactive-5.1-p12-doc
  /nix/store/ar5l6ndkqb4lh1x1d72ybmjxk0razsqf-patch-2.7.6
  /nix/store/cdk3qmyjizs4gz7ba5g9238vycp0q8kl-bzip2-1.0.6.0.2-bin
  /nix/store/hpib3nlliv0aj6a7z22asjnwh0vnqgl9-ed-1.17
  /nix/store/lfv632dva0697k9cnz39xwch8klzyisg-adv_cmds-119-locale
  /nix/store/mc84yav7z6iy1c84p3xxjyaw4i9ff1nd-xz-5.2.5-bin
  /nix/store/qgnpz4dc719npgiwia3dlw8b3hkafnvq-bash-interactive-5.1-p12-dev
  /nix/store/ql8v2kspm7fn2hzvzbrq0mns8xlgbx8n-gawk-5.1.1
  /nix/store/zw06h3iqvaxkbbw573n3qwmib82sk1xm-gnumake-4.3
copying path '/nix/store/aga0m55fspj4njaxbgjxxz2xxf7l48lr-bash-interactive-5.1-p12-doc' from 'https://cache.nixos.org'...
copying path '/nix/store/lfv632dva0697k9cnz39xwch8klzyisg-adv_cmds-119-locale' from 'https://cache.nixos.org'...
copying path '/nix/store/ql8v2kspm7fn2hzvzbrq0mns8xlgbx8n-gawk-5.1.1' from 'https://cache.nixos.org'...
copying path '/nix/store/zw06h3iqvaxkbbw573n3qwmib82sk1xm-gnumake-4.3' from 'https://cache.nixos.org'...
copying path '/nix/store/qgnpz4dc719npgiwia3dlw8b3hkafnvq-bash-interactive-5.1-p12-dev' from 'https://cache.nixos.org'...
copying path '/nix/store/6d1ly7hvmpgghgkdpck82hykyw9miihx-gnu-config-2021-01-25' from 'https://cache.nixos.org'...
copying path '/nix/store/0m5iyhkjpgqf608k7lwy4hwdq786vd7n-gnutar-1.34' from 'https://cache.nixos.org'...
copying path '/nix/store/cdk3qmyjizs4gz7ba5g9238vycp0q8kl-bzip2-1.0.6.0.2-bin' from 'https://cache.nixos.org'...
copying path '/nix/store/hpib3nlliv0aj6a7z22asjnwh0vnqgl9-ed-1.17' from 'https://cache.nixos.org'...
copying path '/nix/store/03ssh45d6wfjf965mifa2l4j6c3fvl3j-hook' from 'https://cache.nixos.org'...
copying path '/nix/store/mc84yav7z6iy1c84p3xxjyaw4i9ff1nd-xz-5.2.5-bin' from 'https://cache.nixos.org'...
copying path '/nix/store/ar5l6ndkqb4lh1x1d72ybmjxk0razsqf-patch-2.7.6' from 'https://cache.nixos.org'...
copying path '/nix/store/0qlq4s175mzlx9g0aqcdk95j92g1z7mf-stdenv-darwin' from 'https://cache.nixos.org'...

>>>>>> doing import stuff that needs done

[nix-shell:~/workspace/dbarrosop/nix-demo]$ echo $SOME_EXTREMELY_IMPORTANT_ENV_VAR
true

[nix-shell:~/workspace/dbarrosop/nix-demo]$ lua -v
Lua 5.2.4  Copyright (C) 1994-2015 Lua.org, PUC-Rio

[nix-shell:~/workspace/dbarrosop/nix-demo]$ luarocks --version
/nix/store/p4gy7ny5d353blv3pwwj86v1xa94ny2f-luarocks-3.2.1/bin/.luarocks-wrapped 3.2.1
LuaRocks main command-line interface


[nix-shell:~/workspace/dbarrosop/nix-demo]$
```

## Overlays

Overlays allow you to make small changes to predefined packages.

See [3-overlays/](3-overlays/)

```
nix-demo on  master [✘!+?] took 3m16s
❯ nix-shell 3-overlays/nix-shell.nix
warning: Nix search path entry '/nix/var/nix/profiles/per-user/root/channels' does not exist, ignoring
these 2 derivations will be built:
  /nix/store/aw029xv9sr86vllf6rrx39ib9r4358i9-source.drv
  /nix/store/azcrazj6h0pag728qmb8zv878m82vv8z-luarocks.drv
these 36 paths will be fetched (4.01 MiB download, 15.40 MiB unpacked):
  /nix/store/1i0d10z9kng87far3i2k3r1l2a752kip-libssh2-1.10.0
  /nix/store/2jfq95vixf5l34xzq3y3ibc0j36mz9l8-nghttp2-1.43.0
  /nix/store/3cx5pcy9qgpx3nj7x5bm5yarqn9fsgvk-openssl-1.1.1m-bin
  /nix/store/3hv86blxqg07ybwivfy47hkv2f3mwf83-zstd-1.5.2-bin
  /nix/store/44iaacdvsjqdqlz96nkxbbb4gr60zgfv-brotli-1.0.9-dev
  /nix/store/49803la5492xgiabj43kqy1sflvbcl40-nghttp2-1.43.0-lib
  /nix/store/4a12laixm1yhcdjhrncmd4z03xgklj5v-nghttp2-1.43.0-dev
  /nix/store/4qiiab6wdvzrrlsbsfpgpq2grhcqv47h-libssh2-1.10.0-dev
  /nix/store/52w2kx3zh3vfn5janz5ag9i61a9r520c-mirrors-list
  /nix/store/634h6dbjj2mm4mgkwc63i3c8dfcp16fb-nghttp2-1.43.0-dev
...
post-installation fixup
strip is /nix/store/km02igh4pshp20d0wn89rf5jjfxcm8v5-clang-wrapper-11.1.0/bin/strip
stripping (with command strip and flags -S) in /nix/store/i06m2gaw5b6dl8c8927q665xa2x3v9xq-luarocks/bin
patching script interpreter paths in /nix/store/i06m2gaw5b6dl8c8927q665xa2x3v9xq-luarocks

[nix-shell:~/workspace/dbarrosop/nix-demo]$ lua -v
Lua 5.4.3  Copyright (C) 1994-2021 Lua.org, PUC-Rio

[nix-shell:~/workspace/dbarrosop/nix-demo]$ luarocks --version
/nix/store/i06m2gaw5b6dl8c8927q665xa2x3v9xq-luarocks/bin/.luarocks-wrapped 3.8.0
LuaRocks main command-line interface
```

Notice the version of lua and luarocks, compared with the previous sections.


## Building software

You can use it to create build environments and build software. As an example we are going to build a sample go program located under `src` and that requires the C library `libvips` to make the build a bit more interesting.

See [4-building/](4-building/)


```
❯ nix-build 4-building/default.nix
warning: Nix search path entry '/nix/var/nix/profiles/per-user/root/channels' does not exist, ignoring
these 4 derivations will be built:
  /nix/store/dwx58y2c4s1bp4j9pg3qxsy73z1fvzs7-builder.pl.drv
  /nix/store/xg6ssrm9dgbvf2r8l40a3p5f4bjm248d-python3-3.9.10-env.drv
  /nix/store/rbcflcpp0qg4jci4d7pyzvq1hqqx6wj9-vips-8.12.6.drv
  /nix/store/x095dqbwqhwnl9mp478qlvyx3xqwxwmk-nix-demo-0.1.0.drv
these 77 paths will be fetched (23.26 MiB download, 126.11 MiB unpacked):
  /nix/store/09bacvnv4jwj7502k7yslw6pk9jh2pca-pkg-config-0.29.2
  /nix/store/0wv3xqhhzhgzaswl8hajwksajbfxiiv9-freetype-2.11.1-dev
  /nix/store/0yjr1bxl3z064pqs0a7cryq85nsbg51p-pango-1.50.3-bin
  /nix/store/1q1d0hnmf9949sadrl8mr8yhgb5z9hj8-fontconfig-2.13.94-bin
  /nix/store/25qidg9qgnz3hw6kqjfmrs6jbz2lkwn3-libtiff-4.2.0-bin
  /nix/store/2kl7wh5ll71hmxc8prjdq4f28l5pllhp-gobject-introspection-1.70.0
  /nix/store/3da3r1bmcm9xw9100qz7mz3lx92fw21g-libtiff-4.2.0-dev
...
strip is /nix/store/ab6dzcys4gy9qpq0dngg8m6icnziqc6m-Toolchains/XcodeDefault.xctoolchain/bin/strip
stripping (with command strip and flags -S) in /nix/store/4a7n2vz6h0yfz3zjqird2mrjhvwrp8ln-nix-demo-0.1.0/bin
patching script interpreter paths in /nix/store/4a7n2vz6h0yfz3zjqird2mrjhvwrp8ln-nix-demo-0.1.0
/nix/store/4a7n2vz6h0yfz3zjqird2mrjhvwrp8ln-nix-demo-0.1.0
```

Notice how nix took care of making sure libvips and everything else necessary to build the go application with the C library was available. Notice also how the compiled result was placed in the nix store and symlinked under `./result`

```
nix-demo on  master [✘!+?] took 3s
❯ ls -la result
lrwxr-xr-x  1 dbarroso  staff  58 Feb 22 09:28 result -> /nix/store/4a7n2vz6h0yfz3zjqird2mrjhvwrp8ln-nix-demo-0.1.0

nix-demo on  master [✘!+?]
❯ ./result/bin/nix-demo
2022/02/22 09:29:00 [VIPS.info] found /nix/store/xdj7snwi5fb4pp34p57vqibh6afwmzqc-vips-8.12.6/lib/vips-modules-8.12
2022/02/22 09:29:00 [VIPS.info] using configure-time prefix
2022/02/22 09:29:00 [VIPS.info] VIPS_PREFIX = /nix/store/xdj7snwi5fb4pp34p57vqibh6afwmzqc-vips-8.12.6
2022/02/22 09:29:00 [VIPS.info] VIPS_LIBDIR = /nix/store/xdj7snwi5fb4pp34p57vqibh6afwmzqc-vips-8.12.6/lib
2022/02/22 09:29:00 [VIPS.info] prefix = /nix/store/xdj7snwi5fb4pp34p57vqibh6afwmzqc-vips-8.12.6
2022/02/22 09:29:00 [VIPS.info] libdir = /nix/store/xdj7snwi5fb4pp34p57vqibh6afwmzqc-vips-8.12.6/lib
2022/02/22 09:29:00 [VIPS.info] searching "/nix/store/xdj7snwi5fb4pp34p57vqibh6afwmzqc-vips-8.12.6/lib/vips-modules-8.12"
2022/02/22 09:29:00 [VIPS.info] loading "/nix/store/xdj7snwi5fb4pp34p57vqibh6afwmzqc-vips-8.12.6/lib/vips-modules-8.12/vips-jxl.so"
2022/02/22 09:29:00 [VIPS.info] loading "/nix/store/xdj7snwi5fb4pp34p57vqibh6afwmzqc-vips-8.12.6/lib/vips-modules-8.12/vips-poppler.so"
2022/02/22 09:29:00 [VIPS.info] loading "/nix/store/xdj7snwi5fb4pp34p57vqibh6afwmzqc-vips-8.12.6/lib/vips-modules-8.12/vips-heif.so"
2022/02/22 09:29:00 [VIPS.info] loading "/nix/store/xdj7snwi5fb4pp34p57vqibh6afwmzqc-vips-8.12.6/lib/vips-modules-8.12/vips-openslide.so"
2022/02/22 09:29:00 [VIPS.info] loading "/nix/store/xdj7snwi5fb4pp34p57vqibh6afwmzqc-vips-8.12.6/lib/vips-modules-8.12/vips-magick.so"
2022/02/22 09:29:00 [VIPS.info] searching "/nix/store/xdj7snwi5fb4pp34p57vqibh6afwmzqc-vips-8.12.6/lib/vips-plugins-8.12"
2022/02/22 09:29:00 [govips.info] vips 8.12.1 started with concurrency=1 cache_max_files=0 cache_max_mem=52428800 cache_max=100
2022/02/22 09:29:00 [govips.info] registered image type loader type=gif
2022/02/22 09:29:00 [govips.info] registered image type loader type=jpeg
2022/02/22 09:29:00 [govips.info] registered image type loader type=svg
2022/02/22 09:29:00 [govips.info] registered image type loader type=webp
2022/02/22 09:29:00 [govips.info] registered image type loader type=heif
2022/02/22 09:29:00 [govips.info] registered image type loader type=magick
2022/02/22 09:29:00 [govips.info] registered image type loader type=pdf
2022/02/22 09:29:00 [govips.info] registered image type loader type=png
2022/02/22 09:29:00 [govips.info] registered image type loader type=tiff
2022/02/22 09:29:00 [govips.info] registered image type loader type=heif
2022/02/22 09:29:00 [govips.info] registered image type loader type=jp2k
2022/02/22 09:29:00 Opening picklerick.jpg
2022/02/22 09:29:00 Resizing image
2022/02/22 09:29:00 [VIPS.info] residual reducev by 0.5
2022/02/22 09:29:00 [VIPS.info] reducev: 13 point mask
2022/02/22 09:29:00 [VIPS.info] residual reduceh by 0.5
2022/02/22 09:29:00 [VIPS.info] reduceh: 13 point mask
2022/02/22 09:29:00 Exporting image
2022/02/22 09:29:00 Saving image to output.jpg
```

## Some considerations

1. We have seen so far (`nix-shell.nix`, `default.nix`) are "idiomatic" but not "standardized"
2. Different channels (or even different versions of the same channel) can yield different results so one could argue builds are not 100% reproducible

## Flakes

Flakes adddresses both issues from the previous slide:

1. inputs (external dependencies) are locked
2. outputs clearly define what and how we are building

See [./5-flakes/](./5-flakes).

Try running inside the folder `./5-flakes`:

- `nix develop`
- `nix develop -c golangci-lint --version`
- `nix flake check --print-build-logs`
- `nix build` (check ./result)
- `nix run`
- `nix run .#go -- version`

## Other goodies

1. [nixos/darwin-nix](https://github.com/LnL7/nix-darwin) - configure your macos declaratively using nix
1. [home-manager](https://github.com/nix-community/home-manager) - manage a user environment (dotfiles and general software) using nix
1. [nixos](https://nixos.org)

## Resources

- https://github.com/tazjin/nix-1p (totally recommended)
- https://changelog.com/shipit/37
- https://nixos.org/guides/nix-pills/
- https://nixos.org/manual/nixpkgs/stable/
