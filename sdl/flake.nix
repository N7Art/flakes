{
  description = "dvui flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  };

  outputs = { self, nixpkgs }: let
    
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      deps = 
          (with pkgs; [
#            wayland-scanner
#            wayland
#            libxkbcommon
#            libGLX
            sdl3
          ])
          ++ (with pkgs.xorg; [

#            libX11
#            libXcursor
#            libXext
#            libXfixes
#            libXi
#            libXinerama
#            libXrandr
#            libXrender
          ]);
    in
    {

packages.${system}.default = pkgs.hello;
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = deps;

      };

      sdl3Deps = deps;
    };


}
