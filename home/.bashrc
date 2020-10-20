# shellcheck shell=bash
# shellcheck disable=1090
# shellcheck disable=1091

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Docs on shell parameter expansion:
# https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

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


# Bash Commands
# -------------
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
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

# Setup homeshick commands
if [ -d "$HOME/.homesick" ]; then
	. "$HOME/.homesick/repos/homeshick/homeshick.sh"
	. "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
fi

# enable powerline bash prompts
if command -v powerline-daemon > /dev/null && [ -f "${LOCAL_PYTHON_PACKAGES}/powerline/bindings/bash/powerline.sh" ]; then
	powerline-daemon -q
    # shellcheck disable=SC2034
	POWERLINE_BASH_CONTINUATION=1
    # shellcheck disable=SC2034
	POWERLINE_BASH_SELECT=1
	. "${LOCAL_PYTHON_PACKAGES}/powerline/bindings/bash/powerline.sh"
fi


# cleanup
# -------

unset reset
unset green
unset blue
unset cyan
