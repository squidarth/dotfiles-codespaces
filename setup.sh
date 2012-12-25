# Step 1: symlink .vimrc to the .vimrc in this folder
export CURRENT_DIR=`pwd -P`

ln -s CURRENT_DIR/.vimrc ~/.vimrc
CURRENT_DIR/viminstall

# Step 2: install oh-my-zsh! 

curl https://raw.github.com/squidarth/oh-my-zsh/master/tools/install.sh | zsh


