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
          nix_path: nixpkgs=channel:nixos-unstable
      - uses: cachix/cachix-action@v10
        with:
          name: riinr
          authToken: "''${{ secrets.CACHIX_AUTH_TOKEN }}"
      - run: nix flake check
''