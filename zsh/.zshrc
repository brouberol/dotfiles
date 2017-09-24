export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="brouberol"
ZSH_DIR=$HOME/.zsh

plugins=(git virtualenvwrapper colored-man-pages python zsh-syntax-highlighting)

# Import exports
exports=$ZSH_DIR/export
if [ -f $exports ]; then
    source $exports
fi

# Import aliases
alias=$ZSH_DIR/alias
if [ -f $alias ]; then
    source $alias
fi

export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL

# User defined key bindings
bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word

function weather {
    curl wttr.in/${1:-lyon}
}


source $ZSH/oh-my-zsh.sh
