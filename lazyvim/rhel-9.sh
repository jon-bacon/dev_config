#!/bin/bash

# This script installs prerequisites for lazyvim on a RHEL 9 based system
set -eEuo pipefail

# Don't need sudo if running as root
SUDO=
if ! [ $(id -u) = 0 ]; then
  SUDO=sudo
fi

# Make sure we're starting sensible
$SUDO dnf -y update
$SUDO dnf -y install epel-release && dnf config-manager --set-enabled crb
$SUDO dnf -y group install 'Development Tools'
$SUDO dnf -y install golang
go install github.com/jesseduffield/lazygit@latest
$SUDO dnf -y install cmake ninja-build fzf ripgrep fd-find luarocks pip wget
pip install ast-grep-cli

NVIM_DIR=$(mktemp -d nvimXXX)
git clone https://github.com/neovim/neovim.git $NVIM_DIR

cd $NVIM_DIR

git checkout stable

make CMAKE_BUILD_TYPE=Release
$SUDO make install
