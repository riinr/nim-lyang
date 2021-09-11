{ system ? builtins.currentSystem
, pkgs ? import <nixpkgs> { }
, pre-commit-hooks ? null
}:
{
  pre-commit-check = pre-commit-hooks.run {
    src = ./.;
    hooks.nixpkgs-fmt.enable = true;
    hooks.nimble-check = {
      enable = true;
      name = "Nim tests";
      entry = "${pkgs.nimble-unwrapped}/bin/nimble check";
      files = "\\.nim$";
      types = [ "text" "nim" ];
      language = "system";
      pass_filenames = false;
    };
  };
}
