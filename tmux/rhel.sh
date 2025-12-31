#!/bin/bash

# This script installs and sets up tmux on Arch Linux
set -eEuo pipefail

# Don't need sudo if running as root
SUDO=
if ! [ $(id -u) = 0 ]; then
  SUDO=sudo
fi

# Make sure we're starting sensible
$SUDO dnf -y update
$SUDO dnf -y install patch tmux xclip
