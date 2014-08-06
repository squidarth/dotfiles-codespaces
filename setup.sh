# Step 1: symlink .vimrc to the .vimrc in this folder
export CURRENT_DIR=`pwd -P`

git clone git@github.com:squidarth/dotfiles.git ~/.dotfiles/

curl https://raw.githubusercontent.com/squidarth/dotfiles/master/viminstall |bash

# Step 2: install oh-my-zsh! 

curl https://raw.githubusercontent.com/squidarth/oh-my-zsh/master/tools/install.sh | zsh

# Step 3 symlink zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
