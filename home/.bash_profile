#!/usr/bin/env sh

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*) os=Linux;;
    Darwin*) os=MacOS;;
    CYGWIN*) os=Cygwin;;
    *) os=Unknown;;
esac
# shellcheck disable=SC2034
export OS_SYSTEM=${os}
unset unameOut
unset os

# set PATH so it includes user's local bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# finds "standard" python paths
if command -v python3 > /dev/null; then
    python_version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    if [ -d "$HOME/Library/Python/${python_version}" ]; then
        export LOCAL_PYTHON_PATH=$HOME/Library/Python/${python_version}
    elif [ -d "$HOME/.local/lib/python${python_version}" ]; then
        export LOCAL_PYTHON_PATH=$HOME/.local/lib/python${python_version}
    fi
    unset python_version

    if [ -d "${LOCAL_PYTHON_PATH}/site-packages" ]; then
        export LOCAL_PYTHON_PACKAGES=${LOCAL_PYTHON_PATH}/site-packages
    elif [ -d "${LOCAL_PYTHON_PATH}/lib/python/site-packages" ]; then
        export LOCAL_PYTHON_PACKAGES=${LOCAL_PYTHON_PATH}/lib/python/site-packages
    fi

    if [ -d "${LOCAL_PYTHON_PATH}/bin" ]; then
        PATH=${LOCAL_PYTHON_PATH}/bin:$PATH
    fi
fi

# shellcheck disable=SC2034
GOPATH=$HOME/.local/lib/go
if [ -d "$HOME/.local/lib/go/bin" ]; then
    PATH="$HOME/.local/lib/go/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# if running bash and .bashrc exists
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    # shellcheck disable=SC1090
    . "$HOME/.bashrc"
fi

