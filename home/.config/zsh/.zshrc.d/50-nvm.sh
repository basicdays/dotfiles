# shellcheck shell=sh

if [ "$SYSTEMOS" = "MacOS" ]; then
    nvm_path=$(brew --prefix)/opt/nvm/nvm.sh
    test -r "$nvm_path" && . "$nvm_path"

    unset nvm_path
fi
