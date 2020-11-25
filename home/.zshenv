#!/usr/bin/env zsh
# shellcheck shell=sh

export BASHDOTDIR="$HOME/.config/bash"
export ZDOTDIR="$HOME/.config/zsh"

if [ -f "$ZDOTDIR/.zshenv" ]; then
	. $ZDOTDIR/.zshenv
fi
