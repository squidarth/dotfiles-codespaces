export CURRENT_DIR=`pwd -P`

curl https://raw.githubusercontent.com/squidarth/oh-my-zsh/master/tools/install.sh | zsh

# Install plug 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~/.vimrc
vim +PlugInstall +qall
cp .tmux.conf ~/.tmux.conf
cp .fzf.conf.zsh ~/.fzf.conf.zsh
cp .zshrc ~/.zshrc
