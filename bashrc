#0. Import common configs
if [ ! $LINUX_TOOLS ]; then
    LINUX_TOOLS=~/bin/LinuxTools
fi
. $LINUX_TOOLS/shrc_base

#1. Show git branch in shell prompt when possible
PS1='[PWD: ${debian_chroot:+($debian_chroot)}\w]  $(parse_git_branch)\n$ '

function parse_git_branch {
    #git rev-parse --abbrev-ref HEAD 2> /dev/null
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

