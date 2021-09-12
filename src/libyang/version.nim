let VERSION* {.importc: "LY_VERSION", header: "<libyang/version.h>".}: cstring
let MAJOR* {.importc: "LY_VERSION_MAJOR", header: "<libyang/version.h>".}: cint
let MINOR* {.importc: "LY_VERSION_MINOR", header: "<libyang/version.h>".}: cint
let MICRO* {.importc: "LY_VERSION_MICRO", header: "<libyang/version.h>".}: cint
