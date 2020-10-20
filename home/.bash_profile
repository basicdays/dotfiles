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
    Linux*) export OSSYSTEM=Linux;;
    Darwin*) export OSSYSTEM=MacOS;;
    CYGWIN*) export OSSYSTEM=Cygwin;;
	MINGW*) export OSSYSTEM=Mingw;;
    *) export OSSYSTEM=Unknown;;
esac


add_to_path() {
    path_dir=$1
    [ -d "${path_dir}" ] && [ -n "${PATH##*${path_dir}}" ] && [ -n "${PATH##*${path_dir}:*}" ]
}

paths=(
	/usr/local/opt/curl/bin
	/usr/local/opt/gettext/bin
	/usr/local/opt/redis@4.0/bin
	/usr/local/mysql/bin
    $HOME/.local/lib/go/bin
    $HOME/.local/cargo/bin
	$HOME/.local/opt/apache-tomcat-9.0.24/bin
	$HOME/.local/bin
)
for path in ${paths[@]}; do
	if add_to_path "${path}"; then
		PATH="${path}:$PATH"
	fi
done

unset paths
unset add_to_path

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

# shellcheck disable=SC2034
export GOPATH=${HOME}/.local/lib/go

# if running bash and .bashrc exists
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
