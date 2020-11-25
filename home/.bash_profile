# shellcheck shell=sh

export BASHDOTDIR="$HOME/.config/bash"
export ZDOTDIR="$HOME/.config/zsh"

if [ -f "$BASHDOTDIR/.bash_profile" ]; then
	. "$BASHDOTDIR/.bash_profile"
fi
