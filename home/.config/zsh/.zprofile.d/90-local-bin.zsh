#!/usr/bin/env zsh
# shellcheck shell=sh

if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi
