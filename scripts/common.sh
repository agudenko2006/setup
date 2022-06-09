#!/bin/bash

debug() {
    echo DEBUG: $1
}

detect_distro() {
    if [[ -e '/bin/apt'    ]]; then distro="debian"; fi
    if [[ -e '/bin/pacman' ]]; then distro="arch"; fi
}

install() {
    echo DEBUG: installing: $*
    if [ $distro = 'debian' ]; then sudo apt install $*; fi
    if [ $distro = 'arch'   ]; then sudo pacman -S --needed $*; fi
}
