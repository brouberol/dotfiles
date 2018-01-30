export ZSH=$HOME/.oh-my-zsh

# needed to make colored-man-pages work
export GROFF_NO_SGR=1

ZSH_THEME="brouberol"
ZSH_DIR=$HOME/.zsh

plugins=(git virtualenvwrapper colored-man-pages python zsh-syntax-highlighting vi-mode)

# Import exports
exports=$ZSH_DIR/export
if [ -f $exports ]; then
    source $exports
fi

export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL

# User defined key bindings
bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word

function weather {
    curl "wttr.in/${1:-lyon}?m"
}


source $ZSH/oh-my-zsh.sh

# Import aliases
alias=$ZSH_DIR/alias
if [ -f $alias ]; then
    source $alias
fi

which nvim > /dev/null
if [ $? -eq 0 ]; then
    alias vim=nvim
fi

function bootstrap_ansible_role {
    local role=$1
    if [ "$role" = "" ]; then
        echo "You must specify a role name"
        return
    fi
    dirs=(tasks handlers vars)
    for dir in $dirs; do
        mkdir -p $role/$dir
        touch $role/$dir/main.yml
    done
    mkdir -p $role/files
    mkdir -p $role/templates
    find $role
}
