# shellcheck shell=sh
# shellcheck disable=1090

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# determine OS system (e.g. Linux, Mac, Windows)
case "$(uname -s)" in
    Linux*) export OS_SYSTEM=Linux;;
    Darwin*) export OS_SYSTEM=MacOS;;
    CYGWIN*) export OS_SYSTEM=Cygwin;;
	MINGW*) export OS_SYSTEM=Mingw;;
    *) export OS_SYSTEM=Unknown;;
esac

add_to_path() {
    path_dir=$1
    [ -d "${path_dir}" ] && [ -n "${PATH##*${path_dir}}" ] && [ -n "${PATH##*${path_dir}:*}" ]
}

# set PATH so it includes user's local bin if it exists
path_dir=${HOME}/.local/bin
if add_to_path "${path_dir}"; then
    PATH=${path_dir}:${PATH}
fi

# finds "standard" python paths
if command -v python3 > /dev/null; then
    python_version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    if [ -d "$HOME/Library/Python/${python_version}" ]; then
        local_python_dir=$HOME/Library/Python/${python_version}
    elif [ -d "$HOME/.local/lib/python${python_version}" ]; then
        local_python_dir=$HOME/.local/lib/python${python_version}
    fi

    if [ -d "${local_python_dir}/site-packages" ]; then
        export LOCAL_PYTHON_PACKAGES=${local_python_dir}/site-packages
    elif [ -d "${local_python_dir}/lib/python/site-packages" ]; then
        export LOCAL_PYTHON_PACKAGES=${local_python_dir}/lib/python/site-packages
    fi

    path_dir=${local_python_dir}/bin
    if add_to_path "${path_dir}"; then
        PATH=${path_dir}:$PATH
    fi
    unset python_version
    unset local_python_dir
fi

# shellcheck disable=SC2034
GOPATH=${HOME}/.local/lib/go
path_dir=${HOME}/.local/lib/go/bin
if add_to_path "${path_dir}"; then
    PATH=${path_dir}:${PATH}
fi

path_dir=$HOME/.cargo/bin
if add_to_path "${path_dir}"; then
    PATH=${path_dir}:${PATH}
fi

unset add_to_path
unset path_dir

# if running bash and .bashrc exists
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
