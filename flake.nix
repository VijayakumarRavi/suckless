{
  description = "Suckless builds";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };
  outputs = {
    self,
    nixpkgs,
  }: let
    supportedSystems = ["x86_64-linux" "aarch64-linux"];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in {
    # Enables `nix fmt` at root of repo to format all nix files
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    packages = forAllSystems (system: {
      dwm = nixpkgs.legacyPackages.${system}.callPackage ./dwm-6.5 {};
      dmenu = nixpkgs.legacyPackages.${system}.callPackage ./dmenu-5.3 {};
      slock = nixpkgs.legacyPackages.${system}.callPackage ./slock-1.5 {};
      st = nixpkgs.legacyPackages.${system}.callPackage ./st-0.9.2 {};
    });
  };
}
