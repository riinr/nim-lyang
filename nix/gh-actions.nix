''
  name: CI
  on: push
  jobs:
    check:
      runs-on: ubuntu-latest
      steps:
      - uses: actions/checkout@v2.3.4
      - uses: cachix/install-nix-action@v13
        with:
          install_url: https://nixos-nix-install-tests.cachix.org/serve/i6laym9jw3wg9mw6ncyrk6gjx4l34vvx/install
          install_options: '--tarball-url-prefix https://nixos-nix-install-tests.cachix.org/serve'
          extra_nix_config: |
            experimental-features = nix-command flakes
      - uses: cachix/cachix-action@v10
        with:
          name: riinr
          authToken: "''${{ secrets.CACHIX_AUTH_TOKEN }}"
      - run: nix flake check
''
