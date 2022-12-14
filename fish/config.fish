if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR vim

alias startx='ssh-agent startx'
set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"

fish_add_path -a --path "$HOME/bin"

