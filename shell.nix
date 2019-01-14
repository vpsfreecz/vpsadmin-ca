let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;

in stdenv.mkDerivation rec {
  name = "vpsadmin-ca";

  buildInputs = with pkgs; [
    git
    openssl
  ];

  shellHooks = ''
    source ./config
  '';
}
