{
  pkgs,
  libX11,
  imlib2,
  libXft,
  stdenv,
  libXinerama,
}:
with pkgs.lib;
  stdenv.mkDerivation rec {
    pname = "dwm";
    version = "6.5";

    src = ./.;

    patches = [
      #  ./patches/dwm-actualfullscreen-20211013-cb3f58a.diff
      #  ./patches/dwm-alternativetags-6.3.diff
      #  ./patches/dwm-alwayscenter-20200625-f04cac6.diff
      #  ./patches/dwm-barpadding-20211020-a786211.diff
      #  ./patches/dwm-cfacts-vanitygaps-6.4_combo.diff
      #  ./patches/dwm-cyclelayouts-20180524-6.2.diff
      #  ./patches/dwm-fixborders-6.2.diff
      #  ./patches/dwm-floatborderwidth-6.3.diff
      #  ./patches/dwm-hide_vacant_tags-6.4.diff
      #  ./patches/dwm-pertag_with_sel-20231003-9f88553.diff
      #  ./patches/dwm-preserveonrestart-6.3.diff
      #  ./patches/dwm-refreshrate-20230826-9554a10.diff
      #  ./patches/dwm-restartsig-20180523-6.2.diff
      #  ./patches/dwm-scratchpads-20200414-728d397b.diff
      #  ./patches/dwm-stacker-6.2.diff
      #  ./patches/dwm-status2d-6.3.diff
      #  ./patches/dwm-status2d-xrdb-6.2.diff
      #  ./patches/dwm-statuscmd-status2d-20210405-60bb3df.diff
      #  ./patches/dwm-statuspadding-6.3.diff
      #  ./patches/dwm-sticky-6.4.diff
      #  ./patches/dwm-stickyindicator-6.2.diff
      #  ./patches/dwm-swallow-6.5.diff
      #  ./patches/dwm-systray-20230922-9f88553.diff
      #  ./patches/dwm-titlecolor-20210815-ed3ab6b4.diff
      #  ./patches/dwm-underlinetags-6.2.diff
      #  ./patches/dwm-winicon-6.3-v2.1.diff
      #  ./patches/dwm-xrdb-6.4.diff
      #  ./patches/systray-iconsize.diff
    ];

    buildInputs = [libX11 libXinerama libXft imlib2];

    unpackPhase = ''cp -r $src/* .'';

    buildPhase = ''make'';

    installPhase = ''make PREFIX=$out DESTDIR="" install'';

    meta = with pkgs.lib; {
      description = "dwm - dynamic window manager for X";
      homepage = "https://github.com/VijayakumarRavi/suckless";
      license = licenses.mit;
      maintainers = ["Vijayakumar Ravi"];
      platforms = platforms.unix;
    };
  }
