# shellcheck shell=sh

# Add to PATH without accidentally duplicating the value
add_to_path() {
    local path_dir=$1
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
scandir "$BASHDOTDIR/bashprofile.d"

unset add_to_path
unset scandir

# if running bash and .bashrc exists
if [ -n "$BASH_VERSION" ] && [ -f "$BASHDOTDIR/.bashrc" ]; then
    . "$BASHDOTDIR/.bashrc"
fi
