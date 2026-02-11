#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
if [ -n "$BASH_ENV" ]; then . "$BASH_ENV"; fi

#functions
extract() {
    case "$1" in
        *.tar)               tar -xf "$1" ;;
        *.tar.gz|*.tgz)      tar -xzf "$1" ;;
        *.tar.bz2|*.tbz2)    tar -xjf "$1" ;;
        *.tar.xz|*.txz)      tar -xJf "$1" ;;
        *.tar.zst)           tar --zstd -xf "$1" ;;
        *.gz)                gunzip "$1" ;;
        *.bz2)               bunzip2 "$1" ;;
        *.xz)                unxz "$1" ;;
        *.zst)               unzstd "$1" ;;
		*.zip)               unzip "$1" ;;
        *) 
        echo "Extract: $i - Unknown/unsupported file format"
        return 2
        ;;
    esac
}

run() {
    [[ $1 == *.c ]] || return 1

    local output=${1%.c}
    gcc -Wall -Wextra -Wpedantic -std=c23 "$1" -o "$output" && "./$output" && rm -rf $output
}

cd() {
	builtin cd "$@" && ls -lAh --color=auto
}

# aliases
alias ls='ls --color=auto'
alias ll='ls -lAh'
alias grep='grep --color=auto'
# TODO: research xbps, and then add more xbps aliases
alias xi='sudo xbps-install -Su'
alias xq='xbps-query -Rs'
alias xr='sudo xbps-remove'
alias brc='vi ~/.bashrc'
alias sbrc='source ~/.bashrc'
alias apps='ls ~/Downloads/software'

PS1='[ \[\e[38;2;128;255;128m\]\[\e[0m\] \w ]\n\$ '
PS2='> '

export EDITOR=vi
export VISUAL=vi
export PAGER=less
