# ~/.profile skeleton
# ~/.profile runs on interactive login shells if it exists
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "~/.profile has run"

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# commandline editing
set -o emacs    # emacs style command line mode (default)
#set -o vi      # vi style command line mode

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# this variable needs to be set for pnewtask/pnewscript to function
# if you don't know what to put here leave it alone or ask your team.
#GROUP=put_your_group_here

# General aliases
unalias rm
alias up='cd ..'
alias rd=rmdir
alias ls='ls --color'
alias l='ls -l --color'
alias lt='ls -lt --color'
alias ldir='ls -l --color | grep "^d"'
alias c='clear'
alias vi=vim

function mkcd {
    mkdir "$@";
    cd "$@"
}


PS1='$(echo "\033[1;34m$($HOME/ps1.py) \$ \033[00m")'

# use this to match all cpp and h files (useful for git adding)
ch="*.[ch]*"

umask 037

# To set the xterm font,
# edit .SecureCRTstart

alias stdcpp='cp ~/.cppdefaults/std_iostream.cpp '

# start tmux only if it hasn't been started
if [ -z "$TMUX" ]; then
    tmux
fi
