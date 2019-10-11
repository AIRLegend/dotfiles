#!/bin/bash
DIRECTORY=$(cd `dirname $0` && pwd)

ln -s ${DIRECTORY}/.vim ~/.vim
ln -s ${DIRECTORY}/.vimrc ~/.vimrc
ln -s ${DIRECTORY}/.zshrc ~/.zshrc
ln -s ${DIRECTORY}/.tmux.conf ~/.tmux.conf
ln -s ${DIRECTORY}/es.utf-8.spl ~/.vim/spell/es.utf-8.spl

#Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
