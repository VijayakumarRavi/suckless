{
  pkgs,
  libX11,
  libXft,
  stdenv,
  libXinerama,
}:
with pkgs.lib;
  stdenv.mkDerivation rec {
    pname = "dmenu";
    version = "5.3";

    src = ./.;

    patches = [
      #  ./patches/dmenu-alpha-20230110-5.2.diff
      #  ./patches/dmenu-border-20230512-0fe460d.diff
      #  ./patches/dmenu-center-5.2.diff
      #  ./patches/dmenu-grid-4.9.diff
      #  ./patches/dmenu-gridnav-5.2.diff
      #  ./patches/dmenu-password-5.0.diff
      #  ./patches/dmenu-xresources-alt-5.0.diff
    ];

    buildInputs = [libX11 libXinerama libXft];

    unpackPhase = ''cp -r $src/* .'';

    buildPhase = ''make'';

    installPhase = ''make PREFIX=$out DESTDIR="" install'';

    meta = with pkgs.lib; {
      description = "dmenu - a dynamic menu for X";
      homepage = "https://github.com/VijayakumarRavi/suckless";
      license = licenses.mit;
      maintainers = ["Vijayakumar Ravi"];
      platforms = platforms.unix;
    };
  }
