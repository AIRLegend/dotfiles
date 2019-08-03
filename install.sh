#!/bin/bash
DIRECTORY=$(cd `dirname $0` && pwd)

ln -s ${DIRECTORY}/.vim ~/.vim
ln -s ${DIRECTORY}/.vimrc ~/.vimrc
ln -s ${DIRECTORY}/.zshrc ~/.zshrc
ln -s ${DIRECTORY}/.tmux.conf ~/.tmux.conf

