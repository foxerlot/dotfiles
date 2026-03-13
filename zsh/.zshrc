alias ls='ls --color=auto'
alias ll="ls -lAh"
alias grep="grep --color=auto"
alias top="top -stats pid,user,time,mem,cpu,th,command -o +pid -s 5"
alias gcc='gcc-15'
alias cc='gcc-15'
alias :q="exit"
alias :so="source"

extract() {
	case "$1" in
		*.tar.bz2) tar xjf "$1" ;;
		*.tar.gz)  tar xzf "$1" ;;
		*.zip)     unzip "$1" ;;
		*.rar)     unrar x "$1" ;;
		*) echo "Don't know how to extract $1" ;;
	esac
}

PROMPT=" %~ %F{black}$%f "

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/Cellar/gcc/15.2.0_1/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export EDITOR=vim
export VISUAL=vim
export PAGER=less
alias vi="vim"

source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# The plugin will auto execute this zvm_after_select_vi_mode function
function zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)
        PROMPT=" %~ %F{black}$%f "
    ;;
    $ZVM_MODE_INSERT)
        PROMPT=" %~ %F{magenta}$%f "
    ;;
    $ZVM_MODE_VISUAL)
        PROMPT=" %~ %F{blue}$%f "
    ;;
    $ZVM_MODE_VISUAL_LINE)
        PROMPT=" %~ %F{blue}$%f "
    ;;
  esac
}
