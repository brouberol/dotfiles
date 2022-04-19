export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="brouberol"
ZSH_DIR=$HOME/.zsh

plugins=(git colored-man-pages python vi-mode fzf direnv)
source $ZSH/oh-my-zsh.sh

source $ZSH_DIR/export
source $ZSH_DIR/alias

# utility function to check if a binary exists
# taken from https://www.arp242.net/zshrc.html
_exists() { (( $+commands[$1] )) }

_exists nvim && alias vim=nvim
_exists jump && eval "$(jump shell)"

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

unfunction _exists
