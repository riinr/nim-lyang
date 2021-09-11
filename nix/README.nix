let
  project = import ./project.nix;
in
''
  ${project.name}
  =========

  ${project.description}


  Developing
  ----------

  ```
  nix develop -c $SHELL
  ```
''
