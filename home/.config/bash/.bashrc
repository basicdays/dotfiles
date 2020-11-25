# shellcheck shell=sh

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

scandir() {
    local _dir=$1
    if [ -d "$_dir" ]; then
        echo $_dir
        for file in $_dir/*; do
            if [ -r "$file" ]; then
                . "$file"
            fi
        done
    fi
}
scandir "$BASHDOTDIR/bashrc.d"
unset scandir
