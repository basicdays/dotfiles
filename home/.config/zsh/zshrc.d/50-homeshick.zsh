# shellcheck shell=sh

if [ -r "$HOME/.homesick/repos/homeshick/homeshick.sh" ]; then
	. "$HOME/.homesick/repos/homeshick/homeshick.sh"
fi
fpath+=$HOME/.homesick/repos/homeshick/completions
