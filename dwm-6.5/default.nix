{pkgs}:
pkgs.stdenv.mkDerivation rec {
  pname = "dwm";
  version = "6.5";

  src = ./.;

  nativeBuildInputs = [pkgs.pkg-config pkgs.libX11 pkgs.libXinerama pkgs.libXft];

  patches = [
    ./patches/dwm-actualfullscreen-20211013-cb3f58a.diff
    ./patches/dwm-alternativetags-6.3.diff
    ./patches/dwm-alwayscenter-20200625-f04cac6.diff
    ./patches/dwm-barpadding-20211020-a786211.diff
    ./patches/dwm-cfacts-vanitygaps-6.4_combo.diff
    ./patches/dwm-cyclelayouts-20180524-6.2.diff
    ./patches/dwm-fixborders-6.2.diff
    ./patches/dwm-floatborderwidth-6.3.diff
    ./patches/dwm-hide_vacant_tags-6.4.diff
    ./patches/dwm-pertag_with_sel-20231003-9f88553.diff
    ./patches/dwm-preserveonrestart-6.3.diff
    ./patches/dwm-refreshrate-20230826-9554a10.diff
    ./patches/dwm-restartsig-20180523-6.2.diff
    ./patches/dwm-scratchpads-20200414-728d397b.diff
    ./patches/dwm-stacker-6.2.diff
    ./patches/dwm-status2d-6.3.diff
    ./patches/dwm-status2d-xrdb-6.2.diff
    ./patches/dwm-statuscmd-status2d-20210405-60bb3df.diff
    ./patches/dwm-statuspadding-6.3.diff
    ./patches/dwm-sticky-6.4.diff
    ./patches/dwm-stickyindicator-6.2.diff
    ./patches/dwm-swallow-6.5.diff
    ./patches/dwm-systray-20230922-9f88553.diff
    ./patches/dwm-titlecolor-20210815-ed3ab6b4.diff
    ./patches/dwm-underlinetags-6.2.diff
    ./patches/dwm-winicon-6.3-v2.1.diff
    ./patches/dwm-xrdb-6.4.diff
    ./patches/systray-iconsize.diff
  ];

  # Compiler flags (adjust as needed)
  CFLAGS = "-I. -I${pkgs.libX11.dev}/include -I${pkgs.libXinerama.dev}/include -I${pkgs.libXft.dev}/include";
  LDFLAGS = "-L${pkgs.libX11.lib}/lib -L${pkgs.libXinerama.lib}/lib -L${pkgs.libXft.lib}/lib";

  installPhase = ''
    mkdir -p $out/bin
    install -m755 dwm $out/bin
    mkdir -p $out/share/man/man1
    install -m644 dwm.1 $out/share/man/man1
  '';

  meta = with pkgs.lib; {
    description = "dwm - dynamic window manager for X";
    homepage = "https://github.com/VijayakumarRavi/suckless";
    license = licenses.mit;
    maintainers = ["Vijayakumar Ravi"];
    platforms = platforms.unix;
  };
}
