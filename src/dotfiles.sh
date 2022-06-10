#!/bin/bash

copy() {
    mkdir -p $2
    cp dotfiles/$1 $2
}

copy config.fish   ~/.config/fish/
copy init.vim      ~/.config/nvim/
copy starship.toml ~/.config/
cp dotfiles/tmux.conf ~/.tmux.conf
