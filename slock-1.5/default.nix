{pkgs}:
pkgs.stdenv.mkDerivation rec {
  pname = "slock";
  version = "1.5";

  src = ./.;

  nativeBuildInputs = [pkgs.pkg-config pkgs.libX11 pkgs.libXrandr];

  patches = [
    ./patches/slock-dwmlogoandblurscreen-1.0.diff
    ./patches/slock-xresources-20191126-53e56c7.diff
  ];

  # Compiler flags (adjust as needed)
  CFLAGS = "-I. -I${pkgs.libX11.dev}/include -I${pkgs.libXrandr.dev}/include";
  LDFLAGS = "-L${pkgs.libX11.lib}/lib -L${pkgs.libXrandr.lib}/lib";

  installPhase = ''
    mkdir -p $out/bin
    install -m755 slock $out/bin
  '';

  meta = with pkgs.lib; {
    description = "slock - simple X display locker";
    homepage = "https://github.com/VijayakumarRavi/suckless";
    license = licenses.mit;
    maintainers = ["Vijayakumar Ravi"];
    platforms = platforms.unix;
  };
}
