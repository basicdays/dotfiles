#!/usr/bin/env zsh
# shellcheck shell=sh

case "$(uname -s)" in
    Linux*) export OSSYSTEM=Linux;;
    Darwin*) export OSSYSTEM=MacOS;;
    CYGWIN*) export OSSYSTEM=Cygwin;;
    MINGW*) export OSSYSTEM=Mingw;;
    *) export OSSYSTEM=Unknown;;
esac


# finds "standard" python paths
if command -v python3 > /dev/null; then
    python_version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

	if command -v brew > /dev/null && [ -d "$(brew --prefix)/lib/python${python_version}" ]; then
		local_python_dir=$(brew --prefix)/lib/python${python_version}
	elif [ -d "$HOME/.local/lib/python${python_version}" ]; then
		local_python_dir=$HOME/.local/lib/python${python_version}
	fi

    if [ -d "${local_python_dir}/site-packages" ]; then
        export LOCAL_PYTHON_PACKAGES=${local_python_dir}/site-packages
    elif [ -d "${local_python_dir}/lib/python/site-packages" ]; then
        export LOCAL_PYTHON_PACKAGES=${local_python_dir}/lib/python/site-packages
    fi

    unset python_version
    unset local_python_dir
fi

echo "Looking in $ZDOTDIR/.zprofile.d"
if [ -d "$ZDOTDIR/.zprofile.d" ]; then
    echo "exists"
    for file in "$ZDOTDIR/.zprofile.d/**/*(.)"; do
        echo $file;
    done
fi
