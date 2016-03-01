#!/usr/bin/env bash
git clone --recursive "git://github.com/andsens/homeshick.git" "$HOME/.homesick/repos/homeshick"
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
homeshick clone basicdays/dotfiles
homeshick cd dotfiles
git remote set-url "git@github.com:basicdays/dotfiles.git"
git submodule init
homeshick link dotfiles
