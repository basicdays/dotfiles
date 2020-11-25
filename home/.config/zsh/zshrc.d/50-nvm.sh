# shellcheck shell=sh

if [ "$OSSYSTEM" = "MacOS" ]; then
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
fi
