# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gregory/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls="ls --color"
alias lsl="ls -lah --color"

alias aptupdate="sudo apt update -y ; sudo apt upgrade -y ; sudo apt autoremove -y"

PROMPT="%K{22}%T%k%K{133}%F{22}%f%k%K{133}%n@%m%k%K{33}%F{133}%f%k%K{33}%d%k%F{33}%f "
RPROMPT=""

export PATH="$PATH:/snap/bin"
export PATH="$PATH:/home/gregory/Downloads/nvim-linux-x86_64/bin"
