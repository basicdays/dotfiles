# shellcheck shell=sh

# Expansion and Globbing

setopt NO_CASE_GLOB


# History

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

HISTFILE="$HOME/.local/var/zsh/.zsh_history"
HISTSIZE=8000
SAVEHIST=5000


# Input/Output

setopt CORRECT
setopt CORRECT_ALL

# Functions

fpath+="$ZDOTDIR/functions"
autoload lp
autoload envall


# VIM!!

export VISUAL=vim
# set viins keymap
bindkey -v


# Scan .zshrc.d

scandir() {
    local _dir=$1
    if [ -d "$_dir" ]; then
        for file in $_dir/*; do
            if [ -r "$file" ]; then
                . "$file"
            fi
        done
    fi
}
scandir "$ZDOTDIR/zshrc.d"
unset scandir


# Completion-System

# compinit fails if group/other have write privs if they are not $USER or root
# compaudit | xargs chmod go-w
#autoload -Uz compinit && compinit -d "$HOME/.local/var/zsh/.zcompdump"

test -f $ZDOTDIR/zsh_completion.zsh && . $ZDOTDIR/zsh_completion.zsh
autoload -U +X bashcompinit && bashcompinit
# . /usr/local/Cellar/bash-completion@2/2.11/share/bash-completion/bash_completion
if [ -d "/usr/local/etc/bash_completion.d" ]; then
    for file in /usr/local/etc/bash_completion.d/*; do
        if [ -r "$file" ] && [[ $file != "*tmux*" ]]; then
        # if [ -r "$file" ]; then
            . "$file"
        fi
    done
fi
