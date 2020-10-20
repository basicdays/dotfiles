#!/usr/bin/env zsh
# shellcheck shell=sh

export ZDOTDIR=$HOME/.config/zsh
if [ -f "$ZDOTDIR/.zshenv" ]; then
	. $ZDOTDIR/.zshenv
fi
