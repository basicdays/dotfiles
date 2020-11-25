# shellcheck shell=sh

reset="\[\033[0m\]"
green="\[\033[1;32m\]"
blue="\[\033[1;34m\]"
cyan="\[\033[1;36m\]"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) COLOR_PROMPT=true;;
	*) COLOR_PROMPT=false;;
esac


# History
# -------

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000


# General
# -------

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
if [ -x /usr/bin/lesspipe ]; then
	eval "$(SHELL=/bin/sh lesspipe)"
fi

# Set default editor program
export VISUAL=vim
#export EDITOR=ex

# set tabstop to 4
tabs 4
export LESS=x4


# Color
# -----

if [ "${COLOR_PROMPT}" = "true" ]; then
	PS1="${green}\u@\h${reset}:${blue}\w${reset}${cyan}${reset}\$ "

	# enable less colors
	export LESS=R${LESS}

	if [ "${OSSYSTEM}" = "MacOS" ]; then
		# enable bsd ls colors
		export CLICOLOR=1
	fi
else
	PS1="\u@\h:\w\$ "
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f "/usr/share/bash-completion/bash_completion" ]; then
		# Linux
		. "/usr/share/bash-completion/bash_completion"
	elif [ -f "/etc/bash_completion" ]; then
		# Linux
		. "/etc/bash_completion"
	elif command -v brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
		. "$(brew --prefix)/etc/bash_completion"
	fi
fi


# cleanup
# -------

unset reset
unset green
unset blue
unset cyan
