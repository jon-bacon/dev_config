#!/bin/bash

# This script installs and sets up lazyvim on a RHEL 9 based system
set -eEuo pipefail

# Don't need sudo if running as root
SUDO=
if ! [ $(id -u) = 0 ]; then
  SUDO=sudo
fi

# Make sure we're starting sensible
$SUDO dnf -y update
$SUDO dnf -y install epel-release && dnf config-manager --set-enabled crb
$SUDO dnf -y install golang
go install github.com/jesseduffield/lazygit@latest
$SUDO dnf -y install fzf ripgrep fd-find luarocks
