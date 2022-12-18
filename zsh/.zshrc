# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ $(uname) = Linux ]; then
    SHARE_DIR=/usr/share
else
    SHARE_DIR=/usr/local/share
fi

export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="brouberol"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_DIR=$HOME/.zsh

plugins=(git colored-man-pages python vi-mode fzf direnv poetry pip)
source $ZSH/oh-my-zsh.sh

source $ZSH_DIR/export
source $ZSH_DIR/alias

# utility function to check if a binary exists
# taken from https://www.arp242.net/zshrc.html
_exists() { (( $+commands[$1] )) }

_exists nvim && alias vim=nvim
_exists jump && eval "$(jump shell)"

source ${SHARE_DIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${SHARE_DIR}/zsh-autosuggestions/zsh-autosuggestions.zsh

unfunction _exists

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
