#!/bin/sh
# Setup script for freebsd10

# UI stuff
#pkg install -y hs-xmonad-contrib
pkg install -y dzen2
pkg install -y dmenu
pkg install -y conky

echo "Installed UI stuff, now run setup.sh as an unprivileged user"
