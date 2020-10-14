#!/usr/bin/env zsh
# shellcheck shell=sh

case "$(uname -s)" in
    Linux*) export OSSYSTEM=Linux;;
    Darwin*) export OSSYSTEM=MacOS;;
    CYGWIN*) export OSSYSTEM=Cygwin;;
    MINGW*) export OSSYSTEM=Mingw;;
    *) export OSSYSTEM=Unknown;;
esac
