# Step 1: symlink .vimrc to the .vimrc in this folder
export CURRENT_DIR=`pwd -P`

ln -s CURRENT_DIR/.vimrc ~/.vimrc

# Step 2: install oh-my-zsh! 

curl https://raw.github.com/squidarth/oh-my-zsh/tools/install.sh | zsh
