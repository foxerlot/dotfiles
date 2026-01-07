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
PS1="\[\e[38;2;0;0;0;48;2;255;128;128m\]\D{%d - %I:%M}\[\e[0m\]\
\[\e[38;2;255;128;128;48;2;128;255;128m\]\[\e[0m\]\
\[\e[38;2;0;0;0;48;2;128;255;128m\] \u@\h \[\e[0m\]\
\[\e[38;2;128;255;128;48;2;128;128;255m\]\[\e[0m\]\
\[\e[38;2;0;0;0;48;2;128;128;255m\] \w\[\e[0m\]\
\[\e[38;2;128;128;255m\]\[\e[0m\] "
PS2="> "

# exports
export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export LC_CTYPE=C.UTF-8
