# shellcheck shell=sh

export POETRY_HOME=$HOME/.local/opt/poetry
add_to_path "$POETRY_HOME/bin"

export PYENV_ROOT=$HOME/.local/lib/pyenv
add_to_path "$PYENV_ROOT/bin"

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
            add_to_path "$local_python_dir/bin"
        fi
    fi
}
find_py
unset find_py
