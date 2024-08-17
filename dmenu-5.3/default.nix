{pkgs}:
pkgs.stdenv.mkDerivation rec {
  pname = "dmenu";
  version = "5.3";

  src = ./.;

  nativeBuildInputs = [pkgs.pkg-config pkgs.libX11 pkgs.libXinerama];

  patches = [
    ./patches/dmenu-alpha-20230110-5.2.diff
    ./patches/dmenu-border-20230512-0fe460d.diff
    ./patches/dmenu-center-5.2.diff
    ./patches/dmenu-grid-4.9.diff
    ./patches/dmenu-gridnav-5.2.diff
    ./patches/dmenu-password-5.0.diff
    ./patches/dmenu-xresources-alt-5.0.diff
  ];

  CFLAGS = "-I. -I${pkgs.libX11.dev}/include -I${pkgs.libXinerama.dev}/include";
  LDFLAGS = "-L${pkgs.libX11.lib}/lib -L${pkgs.libXinerama.lib}/lib";

  installPhase = ''
    mkdir -p $out/bin
    install -m755 dmenu dmenu_path dmenu_run stest $out/bin
    mkdir -p $out/share/man/man1
    install -m644 dmenu.1 stest.1 $out/share/man/man1
  '';

  meta = with pkgs.lib; {
    description = "dmenu - a dynamic menu for X";
    homepage = "https://github.com/VijayakumarRavi/suckless";
    license = licenses.mit;
    maintainers = ["Vijayakumar Ravi"];
    platforms = platforms.unix;
  };
}
