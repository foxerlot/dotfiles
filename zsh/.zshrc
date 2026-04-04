export EDITOR=vim
export VISUAL=vim
export PAGER=less

alias ls="ls --color=auto"
alias ll="ls -lAh"
alias grep="grep --color=auto"
alias gcc="gcc-15"
alias vi="$EDITOR"
alias :q="exit"
alias :ev="$EDITOR ~/.vimrc"
alias :ez="$EDITOR ~/.zshrc"
alias :sz=". ~/.zshrc"
alias :+x="chmod +x"

bindkey -e

extract() {
    case $1 in
        *.tar.gz|*.tgz)  tar -xzf "$1" ;;
        *.tar.bz2)       tar -xjf "$1" ;;
        *.tar.xz)        tar -xJf "$1" ;;
        *.zip)           unzip -o "$1" ;;
        *) echo "unrecognized archive format" ;;
    esac
}

run() {
    output=$(echo "$1" | sed "s/\.[^.]*$//")
    gcc -O3 -Wall -Wextra -Werror -Wpedantic -std=c99 "$1" -o "$output" && \
        ./"$output" && rm -rf "$output"
    return 0
}

export PS1=" %F{cyan}%D{%I:%M}%f %F{blue}%~%f %(?.%F{cyan}.%F{red})λ%f "
export PS2=" %F{cyan}%D{%I:%M}%f %F{blue}%~%f %(?.%F{cyan}.%F{red})Λ%f "

command -v brew >/dev/null 2>&1 && eval "$(/opt/homebrew/bin/brew shellenv)"
command -v thefuck >/dev/null 2>&1 && eval $(thefuck --alias)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/opt/homebrew/Cellar/gcc/15.2.0_1/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"

cd ~
