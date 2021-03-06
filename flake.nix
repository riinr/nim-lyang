{
  description = "nim yang binding using libyang";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.pre-commit-flake.url = "github:cachix/pre-commit-hooks.nix";
  inputs.libyang-flake.url = "path:./nix/libyang";

  outputs = { self, nixpkgs, flake-utils, pre-commit-flake, libyang-flake }:
    let systems = [ "x86_64-linux" ];
    in
    flake-utils.lib.eachSystem systems (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pre-commit-hooks = pre-commit-flake.lib.${system};
        libyang = libyang-flake.outputs.defaultPackage.${system};
        checks = import ./nix/checks.nix { inherit pkgs system pre-commit-hooks; };
        shellHook = checks.pre-commit-check.shellHook;
        devShell = import ./nix/shell.nix { inherit pkgs checks libyang; };
        packages = { libyang = libyang; };
      in
      {
        inherit checks devShell packages;
      }
    );
}
