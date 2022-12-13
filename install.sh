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
install zsh/p10k.zsh ~/.p10k.zsh

# vim
install vim/colors ~/.vim/
install vim/ftplugin ~/.vim/
install vim/.vimrc ~/.vimrc

# git
install git/.gitconfig ~/.gitconfig
install git/.gitconfig-perso ~/.gitconfig-perso
install git/.tigrc ~/.tigrc

# iterm2
if [ "$(uname)" = Darwin ]; then
    install iterm2/com.googlecode.iterm2.plist ~/.com.googlecode.iterm2.plist
fi

# terminator
if [ "$(uname)" = Linux ]; then
    mkdir -p ~/.config/terminator
    install terminator/config ~/.config/terminator/config
fi

# tmux
install tmux/.tmux.conf ~/.tmux.conf

# Karabiner remappings for typematrix
if [ "$(uname)" = Darwin ]; then
    install karabiner/karabiner.json ~/.config/karabiner/karabiner.json
fi

# lf
if [ "$(uname)"  = Linux ]; then
    mkdir -p ~/.config/lf
    install lf/lfrc ~/.config/lf/lfrc
    install lf/pv.sh ~/.config/lf/pv.sh
fi

# general purpose
install inputrc ~/.inputrc

# ipython
mkdir -p ~/.ipython/profile_default
install ipython/profile_default/ipython_config.py  ~/.ipython/profile_default/ipython_config.py

# pgcli
mkdir -p ~/.config/pgcli
install pgcli/config ~/.config/pgcli/config
