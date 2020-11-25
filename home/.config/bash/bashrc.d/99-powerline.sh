# shellcheck shell=sh

if command -v powerline-daemon > /dev/null && [ -f "$LOCAL_PYTHON_PACKAGES/powerline/bindings/bash/powerline.sh" ]; then
	powerline-daemon -q
    # shellcheck disable=SC2034
	POWERLINE_BASH_CONTINUATION=1
    # shellcheck disable=SC2034
	POWERLINE_BASH_SELECT=1
	. "$LOCAL_PYTHON_PACKAGES/powerline/bindings/bash/powerline.sh"
fi
