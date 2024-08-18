{
  gd,
  pkgs,
  libX11,
  libXft,
  stdenv,
  ncurses,
  harfbuzz,
  pkg-config,
  libXinerama,
}:
with pkgs.lib;
  stdenv.mkDerivation rec {
    pname = "st";
    version = "0.9.2";

    src = ./.;

    buildInputs = [libX11 libXinerama libXft pkg-config gd harfbuzz ncurses];

    patches = [
      #./patches/st-alpha-osc11-20220222-0.8.5.diff
      #./patches/st-appsync-20200618-b27a383.diff
      #./patches/st-blinking_cursor-20230819-3a6d6d7.diff
      #./patches/st-bold-is-not-bright-20190127-3be4cf1.diff
      #./patches/st-boxdraw_v2-0.8.5.diff
      #./patches/st-clipboard-0.8.3.diff
      #./patches/st-columnresize.diff
      #./patches/st-delkey-20201112-4ef0cbd.diff
      #./patches/st-desktopentry-0.8.5.diff
      #./patches/st-disable-bold-italic-fonts-0.8.2.diff
      #./patches/st-expected-anysize-0.9.diff
      #./patches/st-externalpipe-0.8.5.diff
      #./patches/st-externalpipe-eternal-0.8.3.diff
      #./patches/st-font2-0.8.5.diff
      #./patches/st-glyph-wide-support-boxdraw-20220411-ef05519.diff
      #./patches/st-ligatures-boxdraw-20210824-0.8.4.diff
      #./patches/st-netwmicon-0.8.5-v2.diff
      #./patches/st-scrollback-0.8.5.diff
      #./patches/st-scrollback-mouse-altscreen-20220127-2c5edf2.diff
      #./patches/st-undercurl-0.9-20240103.diff
      #./patches/st-workingdir-20200317-51e19ea.diff
      #./patches/st-xresources-signal-reloading-20220407-ef05519.diff
    ];

    unpackPhase = ''cp -r $src/* .'';

    buildPhase = ''make clean'';

    installPhase = ''
      make PREFIX=$out DESTDIR="" install
      TERMINFO=$out/share/terminfo tic -sx st.info
    '';

    meta = with pkgs.lib; {
      description = "st - simple terminal for X";
      homepage = "https://github.com/VijayakumarRavi/suckless";
      license = licenses.mit;
      maintainers = ["Vijayakumar Ravi"];
      platforms = platforms.unix;
    };
  }
