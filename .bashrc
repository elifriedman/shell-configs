# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# ~~~~~~~~~~~~~~~~~~~~~~~ USER PROFILE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# commandline editing
set -o emacs    # emacs style command line mode (default)
shopt -s direxpand
#set -o vi      # vi style command line mode
export VISUAL=vim
export EDITOR=$VISUAL

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# this variable needs to be set for pnewtask/pnewscript to function
# if you don't know what to put here leave it alone or ask your team.
#GROUP=put_your_group_here

# General aliases
alias up='cd ..'
alias rd=rmdir
alias ls='ls --color'
alias l='ls -l --color'
alias lt='ls -lt --color'
alias ldir='ls -l --color | grep "^d"'
alias c='clear'
alias vi=vim
alias rf='rm -Rf'

alias vdocker='docker run --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --user=$(id -u)'
#alias vdocker='docker run --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"'

function mkcd {
    mkdir "$@";
    cd "$@"
}

function cl {
    cd "$@";
    ls;
}

function calc ()
{
    python3 -c "import math;print($1)"
}

alias ipy='ipython'

# git alias
alias gs='git status'
alias gsc='gs -uno'
alias gc='git commit'
alias gcm='gc -m'
alias gcl='git clone'
alias gch='git checkout'
alias ga='git add'
alias gb='git branch'
alias gbc='gb --show-current'
alias gd='git diff'
alias gconflicts='gd --name-only --diff-filter=U'
alias gr='git remote -v'
alias grb='git rebase'
alias grm='git rm'
alias gp='git push'
alias gpl='git pull'
alias gl='git log'

alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias tl='tmux ls'
alias gpt='/home/eli/command_line_chatgpt/venv/bin/gpt'
alias dalle='/home/eli/command_line_chatgpt/venv/bin/dalle'


w=/mnt/c/Users/Eli/
function a {
    if [ -z "$1" ]; then 
        source venv/bin/activate
    else
        if ! source "${1}/venv/bin/activate" 2>/dev/null; then
            source "${1}/bin/activate"
        fi
    fi
}
function ta {
    if [ -z "$1" ]; then
        tmux a -t 0
    else
        tmux a -t $1
    fi
}

# Set up PS1 with git branch

parse_git_branch () {
    git rev-parse --symbolic-full-name --abbrev-ref HEAD 2> /dev/null | sed 's#\(.*\)#(\1) #'
}

# To set the xterm font,
# edit .SecureCRTstart


# start tmux only if it hasn't been started
if [ -z "$TMUX" ]; then
    tmux
fi
