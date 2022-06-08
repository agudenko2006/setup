#!/bin/bash

# Necessary variables
distro="unknown"
pkg_base="python3 neovim tmux "
deb_srv="docker docker.io "
arch_srv="docker "

function detect_distro() {
    if [[ -e '/bin/apt'    ]]; then distro="debian"; fi
    if [[ -e '/bin/pacman' ]]; then distro="arch"; fi
}

function install() {
    echo DEBUG: installing: $*
    if [ $distro = 'debian' ]; then sudo apt install $*; fi
    if [ $distro = 'arch'   ]; then sudo pacman -S --needed $*; fi
}

function main() {
    options=("Base" "Server")

    for i in ${!options[@]}; do
        echo "$i) ${options[$i]}"
    done
    echo "For more info please check the readme file"
    echo -n "Please select the version you want: "
    read version

    # Generating the package list
    packages=$pkg_base
    if [ $version -ge 1 ] && [ $distro = 'debian' ]; then packages+=$deb_srv;  fi
    if [ $version -ge 1 ] && [ $distro = 'arch'   ]; then packages+=$arch_srv; fi

    install $packages
}

detect_distro
main
