#!/usr/bin/env sh

# enable color support of ls and also add handy aliases

if [ "${COLOR_PROMPT}" = "true" ]; then
	if [ -x /usr/bin/dircolors ]; then
    	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    	alias ls='ls --color=auto'
	fi

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -laFh'
alias la='ls -aFh'

# list with paging
lp() {
	if [ "${COLOR_PROMPT}" = "true" ]; then
		if [ "${OS_NAME}" = "MacOS" ]; then
			CLICOLOR_FORCE=1 ll $1 | less
		else
			ll --color $1 | less
		fi
	else
		ll $1 | less
	fi
}

if command -v xclip > /dev/null; then
	alias xcopy='xclip -selection clip-board'
	alias xpaste='xclip -selection clip-board -o'
fi
