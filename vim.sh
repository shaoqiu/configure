cwd=$(pwd)
ln -s "$cwd"/.vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim .vimrc
