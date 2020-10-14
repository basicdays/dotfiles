# shellcheck shell=sh

export NVM_DIR=$HOME/.local/lib/nvm

if [ "$SYSTEMOS" = "MacOS" ]; then
    nvm_path=$(brew --prefix)/opt/nvm/nvm.sh
    test -f "$nvm_path" && . $nvm_path

    unset nvm_path
fi
