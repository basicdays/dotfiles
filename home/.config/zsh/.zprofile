#!/usr/bin/env zsh
# shellcheck shell=sh

scandir() {
    local _dir=$1
    if [ -d "$_dir" ]; then
        for file in $_dir/**/*; do
            if [ -f "$file" ]; then
                . "$file"
            fi
        done
    fi
}
#scandir "$ZDOTDIR/.zprofile.d" 2> /dev/null
scandir "$ZDOTDIR/.zprofile.d"
unset scandir
