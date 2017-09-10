export ZSH=/Users/balthazarrouberol/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git virtualenvwrapper colored-man-pages python zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_export
source $HOME/.zsh_alias


# User defined key bindings
bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word

