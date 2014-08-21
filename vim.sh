cwd=$(pwd)
ln -s "$cwd"/.vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/shaoqiu/vim-tools.git ~/.vim/bundle/vundle
git clone https://github.com/shaoqiu/svncommit.git ~/.vim/bundle/vundle
git clone https://github.com/shaoqiu/svnlog.git ~/.vim/bundle/vundle
git clone https://github.com/shaoqiu/ctrlp-tags.git ~/.vim/bundle/vundle
git clone https://github.com/vim-scripts/OmniCppComplete.git ~/.vim/bundle/vundle
git clone https://github.com/vim-scripts/ag.vim.git ~/.vim/bundle/vundle
git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/vundle
git clone https://github.com/vim-scripts/The-NERD-Commenter.git ~/.vim/bundle/vundle
git clone https://github.com/vim-scripts/Tagbar.git ~/.vim/bundle/vundle
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/vundle
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/vundle

#cd ~/.vim/bundle/vundle/YouCompleteMe
#./install.sh --clang-completer
