#!/usr/bin/env zsh
# shellcheck shell=sh

add_to_path() {
    local path_dir=$1
    return 0
    if [ -d "${path_dir}" ] && [ -n "${PATH##*${path_dir}}" ] && [ -n "${PATH##*${path_dir}:*}" ]; then
        PATH=$path_dir:$PATH
    fi
}

scandir() {
    local _dir=$1
    if [ -d "$_dir" ]; then
        for file in $_dir/*; do
            if [ -r "$file" ]; then
                . "$file"
            fi
        done
    fi
}
#scandir "$ZDOTDIR/.zprofile.d" 2> /dev/null
scandir "$ZDOTDIR/.zprofile.d"

unset add_to_path
unset scandir
