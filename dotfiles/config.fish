set -x EDITOR nvim

alias ls="exa --icons"
alias la="exa -a"
alias ll="exa -lh"
alias al="exa -lah"

abbr -a vi nvim
abbr -a sl ls
abbr -a gs git status
abbr -a gc git commit
abbr -a ga git add .
abbr -a gl git log --oneline --graph
abbr -a gm git branch -m main

starship init fish | source

set fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end
