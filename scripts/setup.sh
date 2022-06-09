#!/bin/bash

# Main functions

select_version() {
    options=("Base" "Server")

    for i in ${!options[@]}; do
        echo "$i) ${options[$i]}"
    done
    echo "For more info please check the readme file"
    echo -n "Please select the version you want: "

    read version
}

debug() {
    echo -e "\e[34mDEBUG: \e[36m$*\e[0m"
}

detect_distro() {
    if [[ -e '/bin/apt'    ]]; then distro="debian"; fi
    if [[ -e '/bin/pacman' ]]; then distro="arch"; fi
    debug running on $distro
}

install() {
    debug installing: $*
    if [ $distro = 'debian' ]; then sudo apt install $*; fi
    if [ $distro = 'arch'   ]; then sudo pacman -S --needed $*; fi
}


main() {
    # Calling the other functions to get the variables
    select_version
    detect_distro

    # Generating the package list
    packages=$pkg_base
    if [ $version -ge 1 ] && [ $distro = 'debian' ]; then packages+=$deb_srv;  fi
    if [ $version -ge 1 ] && [ $distro = 'arch'   ]; then packages+=$arch_srv; fi

    install $packages
}
