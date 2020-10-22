# This file is for NixOS users
# copied from instructions at https://eipi.xyz/blog/rust-overlay-nix-shell/

# You need to download a copy of the repository at:
#     https://github.com/mozilla/nixpkgs-mozilla.git
# ..and then point `nix-shell` at this file and it like so:
#     nix-shell stable.nix -I rustoverlay=/path/to/overlay

# [I put the following at the end of `/etc/nixos/configuration.nix` :
#     programs.bash.shellAliases = {
#         ns = "nix-shell stable.nix -I rustoverlay=~/languages/rust/nixpkgs-mozilla";
#     };
# ]

with import <nixpkgs> {};
with import <rustoverlay/rust-overlay.nix> pkgs pkgs;

stdenv.mkDerivation {
  name = "rust-env";
  nativeBuildInputs = [
  	    libxkbcommon

        # for druid to draw things on linux
        cairo
        pango
        atk
        gdk-pixbuf
        gtk3-x11

        #needed for `shello` example
        #glib

  	    pkgconfig
  	    x11
];
  buildInputs = [
    latest.rustChannels.stable.rust
    #latest.rustChannels.nightly.rust
  	    xorg.libXi
  	    xorg.libXrandr
  	    xorg.libXcursor
];

  RUST_BACKTRACE = 1;


  }
