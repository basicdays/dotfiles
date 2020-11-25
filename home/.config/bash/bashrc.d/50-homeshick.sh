# shellcheck shell=sh

if [ -d "$HOME/.homesick" ]; then
	. "$HOME/.homesick/repos/homeshick/homeshick.sh"
	. "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
fi
