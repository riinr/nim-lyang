let
  project = import ./project.nix;
in
''
  # Package

  version       = "${project.version}"
  author        = "${project.author}"
  description   = "${project.description}"
  license       = "${project.license}"
  srcDir        = "src"


  # Dependencies

  requires "nim >= 1.4.8"

  task test, "Run tests":
    exec "find ./tests -iname 'test*.nim' -exec nim r -p:./src {} +"
''
