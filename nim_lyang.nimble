# Package

version       = "0.1.0"
author        = "hugosenari"
description   = "Nim binding for Libyang"
license       = "BSD-3-Clause"
srcDir        = "src"


# Dependencies

requires "nim >= 1.4.8"

task test, "Run tests":
  exec "find ./tests -iname 'test*.nim' -exec nim r -p:./src {} +"
