#! /bin/bash

pushd $(dirname $0)
# This should match the one in aliases
DOTDIR="$HOME/.me"
rm -rf $DOTDIR
mkdir $DOTDIR
cp -rf * $DOTDIR

pushd $DOTDIR

export CURRENT_DIR=`pwd -P`

curl https://raw.githubusercontent.com/squidarth/oh-my-zsh/master/tools/install.sh | zsh


ln -s -f  $DOTDIR/.vimrc ~/.vimrc
ln -s -f  $DOTDIR/.tmux.conf ~/.tmux.conf
ln  -s -f $DOTDIR/.fzf.conf.zsh ~/.fzf.conf.zsh
ln  -s -f $DOTDIR/.zshrc ~/.zshrc

# Install plug 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


vim +PlugInstall +qall
