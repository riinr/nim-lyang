import unittest
import strutils

import libyang/version

test "has version":
  check count($VERSION, '.') == 2

test "has major":
  check MAJOR == 2

test "has minor":
  check MINOR >= 0

test "has micro":
  check MICRO >= 0
