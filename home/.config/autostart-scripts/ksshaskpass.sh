#!/usr/bin/env sh

# Setup KWwallet usage
if command -v ksshaskpass; then
    export SSH_ASKPASS="ksshaskpass"
    ssh-add < /dev/null
fi
