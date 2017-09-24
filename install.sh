#!/bin/bash

SCRIPT_PATH=$(dirname $(realpath -s $0))

function install {
    ln -vsf $SCRIPT_PATH/$1 $2
}

# Install oh-my-zsh if needed
if [ ! -d $HOME/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
mkdir -p ~/.zsh
touch ~/.zsh/export
touch ~/.zsh/alias
install zsh/.zshrc ~/.zshrc
install zsh/brouberol.zsh-theme ~/.oh-my-zsh/themes/brouberol.zsh-theme
install vim/.vimrc ~/.vimrc
install git/.gitconfig ~/.gitconfig
install git/.tigrc ~/.tigrc
install ptpython ~/.ptpython
