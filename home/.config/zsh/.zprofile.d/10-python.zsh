#!/usr/bin/env zsh
# shellcheck shell=sh

find_py() {
    local python_version
    local local_python_dir

    # finds "standard" python paths
    if command -v python3 > /dev/null; then
        python_version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

        if [ "$OSSYSTEM" = "MacOS" ]; then
            local_python_dir=$HOME/Library/Python/$python_version
        elif [ "$OSSYSTEM" = "Linux" ]; then
            local_python_dir=$HOME/.local/lib/python$python_version
        fi

        if [ -d "$local_python_dir/lib/python/site-packages" ]; then
            export LOCAL_PYTHON_PACKAGES=${local_python_dir}/lib/python/site-packages
        fi
        if [ -d "$local_python_dir/bin" ]; then
            export PATH=$local_python_dir/bin:$PATH
        fi
    fi
}
find_py
unset find_py
