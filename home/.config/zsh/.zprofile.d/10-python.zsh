#!/usr/bin/env zsh
# shellcheck shell=sh

find_py() {
    local python_version
    local local_python_dir
    echo "running"

    # finds "standard" python paths
    if command -v python3 > /dev/null; then
        echo "found py"
        python_version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
        echo "py version $python_version"

        if command -v brew > /dev/null && [ -d "$(brew --prefix)/lib/python${python_version}" ]; then
            local_python_dir=$(brew --prefix)/lib/python${python_version}
        elif [ -d "$HOME/.local/lib/python${python_version}" ]; then
            local_python_dir=$HOME/.local/lib/python${python_version}
        fi
        echo $local_python_dir

        if [ -d "${local_python_dir}/site-packages" ]; then
            export LOCAL_PYTHON_PACKAGES=${local_python_dir}/site-packages
        elif [ -d "${local_python_dir}/lib/python/site-packages" ]; then
            export LOCAL_PYTHON_PACKAGES=${local_python_dir}/lib/python/site-packages
        fi
    fi

}
find_py
unset find_py
