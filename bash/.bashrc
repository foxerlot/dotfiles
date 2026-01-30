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

git_ps1() {
    git rev-parse --is-inside-work-tree &>/dev/null || return

    status=$(git status | head -n 1 | awk '{ print $3 }')
    echo "  $status"
}

__update_ps1() {
    PS1="\[\e[38;2;255;128;128m\]\[\e[0m\]\
\[\e[38;2;0;0;0;48;2;255;128;128m\]\D{%I:%M}\[\e[0m\]\
\[\e[38;2;255;128;128;48;2;255;128;0m\]\[\e[0m\]\
\[\e[38;2;255;128;0;48;2;255;255;128m\]\[\e[0m\]\
\[\e[38;2;255;255;128;48;2;128;255;128m\]\[\e[0m\]\
\[\e[38;2;0;0;0;48;2;128;255;128m\]\w\[\e[0m\]\
\[\e[38;2;128;255;128;48;2;128;255;255m\]\[\e[0m\]\
\[\e[38;2;128;255;255;48;2;128;128;255m\]\[\e[0m\]\
\[\e[38;2;0;0;0;48;2;128;128;255m\]$(git_ps1)\[\e[0m\]\
\[\e[38;2;128;128;255;48;2;255;128;255m\]\[\e[0m\]\
\[\e[38;2;255;128;255m\]\[\e[0m\] "
}

term_maps() {
    cat ~/Documents/txt_documents/term_escape_codes.txt
}

# aliases
alias ls="ls --color=auto"
alias ll="ls -lAh"
alias grep="grep --color=auto"
alias vi="nvim"

eval $(thefuck --alias)

# prompt
declare -a PROMPT_COMMAND
PROMPT_COMMAND+=(__update_ps1)
PS2="> "

# exports
export PATH="/home/gregory/Downloads/software/idea-IU-253.30387.90/bin:$PATH"
export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export LC_CTYPE=C.UTF-8
export EDITOR=nvim
export VISUAL=nvim
