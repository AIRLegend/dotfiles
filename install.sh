#!/bin/bash
DIRECTORY=$(cd `dirname $0` && pwd)

ln -s ${DIRECTORY}/.vim ~/.vim
ln -s ${DIRECTORY}/.vimrc ~/.vimrc
ln -s ${DIRECTORY}/.zshrc ~/.zshrc
ln -s ${DIRECTORY}/.tmux.conf ~/.tmux.conf
ln -s ${DIRECTORY}/.tmux ~/.tmux
ln -s ${DIRECTORY}/es.utf-8.spl ~/.vim/spell/es.utf-8.spl

#Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#Install tmux Plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install fzf
if [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        brew install fzf
        # To install useful key bindings and fuzzy completion:
        $(brew --prefix)/opt/fzf/install
else
        # Linux
        echo "You'll have to manually install fzf here..."

