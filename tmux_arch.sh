#!/bin/bash

# This script installs and sets up tmux on Arch Linux
set -eEuo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# Make sure we're starting sensible
sudo pacman -Suy
sudo pacman -S tmux

# The next bits come mainlyu from a blog I found https://www.markneuburger.com/git-statuses-in-tmux-panes/

# Install "Oh My tmux"
pushd "${HOME}"
git clone --single-branch https://github.com/gpakosz/.tmux.git
popd

# Create tmux configs
mkdir -p "${HOME}"/.config/tmux
ln -s "${HOME}"/.tmux/.tmux.conf "${HOME}"/.config/tmux/tmux.conf
cp "${HOME}"/.tmux/.tmux.conf.local "${HOME}"/.config/tmux/tmux.conf.local

# Install git-statuses-in-tmux-panes
mkdir -p "${HOME}"/.dotfiles
cp "${SCRIPT_DIR}"/tmux/pane-border-format.sh "${HOME}"/.dotfiles

# Fix some defaults and enable git-statuses-in-tmux-panes
pushd "${HOME}"/.config/tmux
patch -p0 <"${SCRIPT_DIR}"/tmux/tmux.conf.local.patch
popd
