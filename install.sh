#!/bin/bash

SCRIPT_PATH=$(dirname $(realpath -s $0))

function install {
    ln -vsf $SCRIPT_PATH/$1 $2
}

# Install oh-my-zsh if needed
if [ ! -d $HOME/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# zsh
mkdir -p ~/.zsh
touch ~/.zsh/export
touch ~/.zsh/alias

install zsh/.zshrc ~/.zshrc
install zsh/brouberol.zsh-theme ~/.oh-my-zsh/themes/brouberol.zsh-theme

# vim
mkdir -p ~/.vim/colors
install vim/colors/molokai.vim ~/.vim/colors/molokai.vim
install vim/.vimrc ~/.vimrc

# git
install git/.gitconfig ~/.gitconfig
install git/.tigrc ~/.tigrc

# ptpython
mkdir -p ~/.ptpyhon
install ptpython/config.py ~/.ptpython/config.py

# terminator
if [ "$(uname)" = Linux ]; then
    mkdir -p ~/.config/terminator
    install terminator/config ~/.config/terminator/config
fi

# tmux
install tmux/.tmux.conf ~/.tmux.conf

# Karabiner remappings for typematrix
if [ "$(uname)" = Darwin ]; then
    mkdir -p ~/.config/karabiner/assets/complex_modifications
    install karabiner/karabiner.json ~/.config/karabiner/karabiner.json
    install karabiner/assets/complex_modifications/firefox.json ~/.config/karabiner/assets/complex_modifications/firefox.json
fi

# lf
mkdir -p ~/.config/lf
install lf/lfrc ~/.config/lf/lfrc
