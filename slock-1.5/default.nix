{
  pkgs,
  stdenv,
  libX11,
  libXrandr,
  pkg-config,
}:
with pkgs.lib;
  stdenv.mkDerivation rec {
    pname = "slock";
    version = "1.5";

    src = ./.;

    nativeBuildInputs = [pkgs.pkg-config pkgs.libX11 pkgs.libXrandr];

    patches = [
      ./patches/slock-dwmlogoandblurscreen-1.0.diff
      ./patches/slock-xresources-20191126-53e56c7.diff
    ];

    buildInputs = [pkg-config libX11 libXrandr];

    unpackPhase = ''cp -r $src/* .'';

    buildPhase = ''make'';

    installPhase = ''make PREFIX=$out DESTDIR="" install'';

    meta = with pkgs.lib; {
      description = "slock - simple X display locker";
      homepage = "https://github.com/VijayakumarRavi/suckless";
      license = licenses.mit;
      maintainers = ["Vijayakumar Ravi"];
      platforms = platforms.unix;
    };
  }
