#!/bin/bash

# Main functions

select_version() {
    options=("Base" "Server" "Dev")

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
    if [[ -e '/usr/bin/apt'    ]]; then distro="deb"; fi
    if [[ -e '/usr/bin/pacman' ]]; then distro="arch"; fi
    debug running on $distro
}

install() {
    debug installing: $*
    if [ "$distro" = "deb" ]; then sudo apt install python3-pip $*; fi
    if [ "$distro" = "arch"   ]; then sudo pacman -S --needed $*; fi
}


main() {
    # Calling the other functions to get the variables
    select_version
    detect_distro

    # Installing things that are not in the repos
    install curl # just making sure that it's there

    if [ $version -ge 2 ]; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        python3 -m pip install ansible
    fi # Dev

    curl -sS https://starship.rs/install.sh | sh # starship prompt
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
               https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' #vimplug

    # Generating the package list
    packages=$pkg_base
    if [ $version -ge 1 ]; then pkg=$distro\_srv; echo $pkg; packages+=${!pkg};  fi
    if [ $version -ge 2 ]; then pkg=$distro\_dev; packages+=${!pkg};  fi

    install $packages
}
