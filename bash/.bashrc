#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
if [ -n "$BASH_ENV" ]; then . "$BASH_ENV"; fi

# aliases
alias ls="ls --color=auto"
alias ll="ls -lAh"
alias grep="grep --color=auto"
alias load="clear ; fastfetch ; timedatectl status ; lsblk ; ip link ; ls"

# prompt
PS1="\D{%d - %I:%M}> \u@\h> \w> "
PS2="> "

# exports
export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export LC_CTYPE=C.UTF-8
