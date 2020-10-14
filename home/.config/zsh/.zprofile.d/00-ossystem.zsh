# shellcheck shell=sh

case "$(uname -s)" in
    Linux*) OSSYSTEM=Linux;;
    Darwin*) OSSYSTEM=MacOS;;
    CYGWIN*) OSSYSTEM=Cygwin;;
    MINGW*) OSSYSTEM=Mingw;;
    *) OSSYSTEM=Unknown;;
esac
