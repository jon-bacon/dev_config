#!/bin/bash

# This script will install lazyvim and it's dependencies on linux
set -eEuo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# Figure out which OS we're running on and install tmux
if [ -f /etc/os-release ]; then
  . /etc/os-release
else
  echo "Unable to determine which OS is running!"
  exit 1
fi

if [ "${ID}" = "cachyos" ]; then
  "${SCRIPT_DIR}"/lazyvim/arch.sh
elif [ "${ID}" = "almalinux" ]; then
  "${SCRIPT_DIR}"/lazyvim/rhel-9.sh
else
  echo "Not able to install lazyvim on OS ${ID}"
  exit 1
fi

pushd "${HOME}"
git clone https://github.com/LazyVim/starter .config/nvim
popd

rm -rf "${HOME}"/.config/nvim/.git
