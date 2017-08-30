#!/bin/bash

# Preparing VIM
core()
{
  echo "Running VIM Core"

  # Creating empty vimrc file
  touch ~/.vimrc

  # Install Pathogen
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  # NERDTree
  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

  # NERDTree Git PLugin
  git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin

  # VIM-Fugitive (Git for VIM)
  git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

  # VIM SuperTab
  git clone https://github.com/ervandew/supertab.git ~/.vim/bundle/supertab

  # CtrlP
  git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

  # Auto Pairs
  git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs

  # Nerd Commenter
  git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter
  
  # Tagbar
  git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar
  
  # VIM Airline
  git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
  
  # VIM gitgutter
  git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
  
  # VIM markdown
  git clone https://github.com/tpope/vim-markdown.git ~/.vim/bundle/vim-markdown
  
  # VIM multiple-cursors
  git clone https://github.com/terryma/vim-multiple-cursors.git ~/.vim/bundle/vim-multiple-cursors
  
  # VIM Sensible
  git clone https://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible
  
  # VIM Solarized
  git clone https://github.com/lifepillar/vim-solarized8.git ~/.vim/bundle/vim-solarized8
  
  # VIM Wordy
  git clone https://github.com/reedes/vim-wordy.git ~/.vim/bundle/vim-wordy
}

config_core()
{
  echo "Config VIM Core"

  cat >> ~/.vimrc <<EOL
" Core Configs
" ============
execute pathogen#infect()
call pathogen#helptags()

set number
set ruler
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

syntax on
filetype plugin indent on

set backspace=2
"set listchars=space:.,tab:>-
"set list
set hlsearch

set cursorline

set showmode
set autoread

set scrolloff=5

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

set splitbelow
set splitright
EOL
}

config_solzrized()
{
  cat >> ~/.vimrc <<EOL
" Solarized Configs
" =================
colorscheme solarized8_dark
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
EOL
}

config_nerdtree()
{
  cat >> ~/.vimrc <<EOL

" NerdTree Configs
" ================
" Open Automatically
"autocmd VimEnter * NERDTree

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
EOL
}

config_ctrlp()
{
  cat >> ~/.vimrc <<EOL
" CtrlP Configs
" =============
let g:ctrlp_map = '<c-p>'
let g:ctrlp_show_hidden = 1
EOL
}

ruby()
{
  echo "Running VIM Ruby"

  # VIM Ruby
  git clone https://github.com/vim-ruby/vim-ruby.git ~/.vim/bundle/vim-ruby

  # VIM Rails
  git clone https://github.com/tpope/vim-rails.git ~/.vim/bundle/vim-rails

  # VIM Bundler
  git clone https://github.com/tpope/vim-bundler.git ~/.vim/bundle/vim-bundler
}

docker()
{
  # Dockerfile
  git clone https://github.com/ekalinin/Dockerfile.vim.git ~/.vim/bundle/Dockerfile.vim
}

core \
  && config_core \
  && config_solzrized \
  && config_ctrlp \
  && config_nerdtree \
  && docker \
  && ruby
