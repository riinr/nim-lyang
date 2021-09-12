let VERSION {.importc: "LY_VERSION", header: "<libyang/version.h>".}: cstring

echo VERSION
