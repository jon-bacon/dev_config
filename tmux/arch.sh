#!/bin/bash

# This script installs and sets up tmux on Arch Linux
set -eEuo pipefail

# Don't need sudo if running as root
SUDO=
if ! [ $(id -u) = 0 ]; then
  SUDO=sudo
fi

# Make sure we're starting sensible
$SUDO pacman -Suy --noconfirm
$SUDO pacman -S --noconfirm patch tmux wl-clipboard
