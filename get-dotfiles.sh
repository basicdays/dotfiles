#!/usr/bin/env bash
git clone "git://github.com/andsens/homeshick.git" "$HOME/.homesick/repos/homeshick"
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
homeshick clone basicdays/dotfiles
homeshick cd dotfiles
git remote set-url origin "git@github.com:basicdays/dotfiles.git"
git submodule update --init
homeshick link dotfiles