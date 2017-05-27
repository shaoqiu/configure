#!/bin/bash
set -e 

cwd=$(pwd)
ln -sf "$cwd"/.vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/shaoqiu/vim-tools.git ~/.vim/bundle/vim-tools
git clone https://github.com/shaoqiu/svncommit.git ~/.vim/bundle/svncommit
git clone https://github.com/shaoqiu/svnlog.git ~/.vim/bundle/svnlog
git clone https://github.com/shaoqiu/ctrlp-tags.git ~/.vim/bundle/ctrlp-tags
git clone https://github.com/vim-scripts/OmniCppComplete.git ~/.vim/bundle/OmniCppComplete
git clone https://github.com/vim-scripts/ag.vim.git ~/.vim/bundle/ag.vim
git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
git clone https://github.com/vim-scripts/The-NERD-Commenter.git ~/.vim/bundle/The-NERD-Commenter
git clone https://github.com/vim-scripts/Tagbar.git ~/.vim/bundle/Tagbar
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe

cd ~/.vim/bundle/YouCompleteMe
if [[ ! -f ./third_party/ycmd/build.py ]]; then
    git submodule update --init --recursive
fi

./install.py --clang-completer
