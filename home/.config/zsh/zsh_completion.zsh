# shellcheck shell=sh

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]}' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/Users/paulsanchez/.config/zsh/zsh_completion'

autoload -Uz compinit
compinit -d "$HOME/.local/var/zsh/.zcompdump"
# End of lines added by compinstall
