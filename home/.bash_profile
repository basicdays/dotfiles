#!/usr/bin/env sh

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# finds "standard" python paths
if command -v python3 > /dev/null; then
	python_version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

	if command -v brew > /dev/null && [ -d "$(brew --prefix)/lib/python${python_version}" ]; then
		export LOCAL_PYTHON_PATH=$(brew --prefix)/lib/python${python_version}
	elif [ -d "$HOME/.local/lib/python" ]; then
		export LOCAL_PYTHON_PATH=$HOME/.local/lib/python
	fi
	unset python_version

	if [ -d "${LOCAL_PYTHON_PATH}/site-packages" ]; then
		export LOCAL_PYTHON_PACKAGES=${LOCAL_PYTHON_PATH}/site-packages
	elif [ -d "${LOCAL_PYTHON_PATH}/lib/python/site-packages" ]; then
		export LOCAL_PYTHON_PACKAGES=${LOCAL_PYTHON_PATH}/lib/python/site-packages
	fi
fi

paths=(
	/usr/local/opt/curl/bin
	/usr/local/opt/gettext/bin
	/usr/local/opt/redis@4.0/bin
	/usr/local/mysql/bin
	$HOME/.local/opt/apache-tomcat-9.0.24/bin
	$HOME/.local/bin
)

for path in ${paths[@]}; do
	if [ -d "${path}" ]; then
		PATH="${path}:$PATH"
	fi
done

if [ -f "/usr/local/opt/nvm/nvm.sh" ]; then
	export NVM_DIR="$HOME/.nvm"
	. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
fi

# if running bash and .bashrc exists
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
