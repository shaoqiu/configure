cwd=$(pwd)
ln -s "$cwd"/.vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cd ~/.vim/bundle
git clone https://github.com/shaoqiu/vim-tools.git 
git clone https://github.com/shaoqiu/svncommit.git
git clone https://github.com/shaoqiu/svnlog.git 
git clone https://github.com/shaoqiu/ctrlp-tags.git 
git clone https://github.com/vim-scripts/OmniCppComplete.git 
git clone https://github.com/vim-scripts/ag.vim.git 
git clone https://github.com/jiangmiao/auto-pairs.git
git clone https://github.com/vim-scripts/The-NERD-Commenter.git
git clone https://github.com/vim-scripts/Tagbar.git 
git clone https://github.com/kien/ctrlp.vim.git 
git clone https://github.com/Valloric/YouCompleteMe.git 

#cd ~/.vim/bundle/vundle/YouCompleteMe
#./install.sh --clang-completer
