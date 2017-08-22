{ghc}:
with (import <nixpkgs> {});

haskell.lib.buildStackProject {
  inherit ghc;
  name = "myEnv";
  buildInputs = [ zlib x11 ] ++ (with xorg; [ libX11 libXcursor libXext libXfixes libXi libXinerama libXrandr libXxf86vm mesa ]);
}
