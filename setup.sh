#!/bin/bash
source ./src/setup.sh

# Base packages
pkg_base="python3 neovim tmux fish exa ripgrep "

# Debian packages
deb_srv="docker docker.io "
deb_dev=""

# Arch packages
arch_srv="docker "
arch_dev="base-devel"

# Starting the actual script
main
bash src/dotfiles.sh
