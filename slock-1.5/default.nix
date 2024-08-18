{
  pkgs,
  stdenv,
  libX11,
  imlib2,
  libXft,
  libXext,
  libXrandr,
  libxcrypt,
  pkg-config,
  libXinerama,
}:
with pkgs.lib;
  stdenv.mkDerivation rec {
    pname = "slock";
    version = "1.5";

    src = ./.;

    patches = [
      # ./patches/slock-dwmlogoandblurscreen-1.0.diff
      # ./patches/slock-xresources-20191126-53e56c7.diff
    ];

    buildInputs = [pkg-config libX11 libXrandr libXinerama imlib2 libXft libXext libxcrypt];

    unpackPhase = ''cp -r $src/* .'';

    buildPhase = ''make'';

    installPhase = ''
      mkdir -p $out/bin
      make PREFIX=$out DESTDIR="" clean install
      install -Dm755 slock $out/bin/
      mkdir -p $out/share/man/man1
      install -m 644 slock.1 $out/share/man/man1/
    '';

    meta = with pkgs.lib; {
      description = "slock - simple X display locker";
      homepage = "https://github.com/VijayakumarRavi/suckless";
      license = licenses.mit;
      maintainers = ["Vijayakumar Ravi"];
      platforms = platforms.unix;
    };
  }
