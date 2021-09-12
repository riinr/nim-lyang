{
  description = "YANG data modeling language library";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    let systems = [ "x86_64-linux" ];
    in
    flake-utils.lib.eachSystem systems (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        stdenv = pkgs.stdenv;
        gitSrc = pkgs.fetchFromGitHub {
          owner = "CESNET";
          repo = "libyang";
          rev = "69d9fff65abb58beb0bb6aa9ecacd572ca1dfc56";
          sha256 = "sha256-QIeqfaxXubUSPQ/zmXi47dR4XhUetgfdRrYbfw7Vp6Q=";
        };
      in
      {
        defaultPackage = stdenv.mkDerivation {
          name = "libyang";
          src = gitSrc;
          buildInputs = with pkgs; [ cmake pcre2 ];
          meta = with pkgs.lib; {
            description = "YANG data modeling language library";
            homepage = "https://github.com/CESNET/libyang";
            license = licenses.bsd3;
            platforms = systems;
          };
        };
      }
    );
}
