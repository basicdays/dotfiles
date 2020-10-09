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

export GOPATH="${HOME}/.local/lib/go"
export CARGO_HOME="${HOME}/.local/opt/cargo"
export POETRY_HOME="${HOME}/.local/opt/poetry"
export PYENV_ROOT="${HOME}/.local/opt/pyenv"


add_to_path() {
    path_dir=$1
    [ -d "${path_dir}" ] && [ -n "${PATH##*${path_dir}}" ] && [ -n "${PATH##*${path_dir}:*}" ]
}

paths=(
	/usr/local/opt/curl/bin
	/usr/local/opt/gettext/bin
	/usr/local/opt/redis@4.0/bin
	/usr/local/mysql/bin
	$GOPATH/bin
	$CARGO_HOME/bin
	$POETRY_HOME/bin
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

export NVM_DIR="${HOME}/.local/lib/nvm"
# export JDK_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home"

if command -v brew > /dev/null; then
    path_dir=$(brew --prefix)/opt/nvm/nvm.sh
    if [ -f "${path_dir}" ]; then
        . "${path_dir}"
    fi
fi

# if running bash and .bashrc exists
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

tpc_exports=$HOME/Documents/wip/tpc/thepillclub_backend/local.exports
if [ -f "${tpc_exports}" ]; then
	. ${tpc_exports}
fi
unset tpc_exports
export CATALINA_HOME=${HOME}/.local/opt/apache-tomcat-9.0.24
export ORG_GRADLE_PROJECT_tomcatLocalWebAppPath=${CATALINA_HOME}

if [ -d "$HOME/.profile.d" ]; then
    for i in "$HOME"/.profile.d/*.sh; do
        if [ -r "$i" ]; then
            . "$i"
        fi
    done
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v jenv 1>/dev/null 2>&1; then
	eval "$(jenv init -)"
fi
