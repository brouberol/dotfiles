export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="brouberol"
ZSH_DIR=$HOME/.zsh

plugins=(git virtualenvwrapper colored-man-pages python vi-mode)
source $ZSH/oh-my-zsh.sh

source $ZSH_DIR/export
source $ZSH_DIR/alias

which nvim > /dev/null
if [ $? -eq 0 ]; then
    alias vim=nvim
fi


# activate jump command
which jump > /dev/null 2>/dev/null
if [ $? -eq 0 ]; then
    eval "$(jump shell)"
fi


source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
