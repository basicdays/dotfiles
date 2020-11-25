# shellcheck shell=sh

export BASHDOTDIR="$HOME/.config/bash"
if [ -f "$BASHDOTDIR/.bash_profile" ]; then
	. "$BASHDOTDIR/.bash_profile"
fi
