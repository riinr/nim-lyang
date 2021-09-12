{ system ? builtins.currentSystem
, pkgs ? import <nixpkgs> { }
, pre-commit-hooks ? null
}:
{
  pre-commit-check = pre-commit-hooks.run {
    src = ./.;
    hooks.nixpkgs-fmt.enable = true;
    hooks.nim-test = {
      enable = true;
      name = "Nim Tests";
      entry = "${pkgs.nimble-unwrapped}/bin/nimble test";
      files = "\\.nim$";
      types = [ "text" "nim" ];
      language = "system";
      pass_filenames = false;
    };
  };
}
