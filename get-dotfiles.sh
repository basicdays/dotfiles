#!/usr/bin/env sh
set -eu


git clone "git://github.com/andsens/homeshick.git" "$HOME/.homesick/repos/homeshick"
# shellcheck disable=1090
. "$HOME/.homesick/repos/homeshick/homeshick.sh"
homeshick clone git@github.com:basicdays/dotfiles.git
homeshick clone git@github.com:basicdays/dotfiles-macos.git
homeshick clone git@github.com:basicdays/dotfiles-ubuntu.git
homeshick link dotfiles

case "$(uname -s)" in
    Linux*)
        homeshick link dotfiles-ubuntu
        ;;
    Darwin*)
        homeshick link dotfiles-macos
        ln -s "../../../../.config/Code/User/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
        ;;
esac
