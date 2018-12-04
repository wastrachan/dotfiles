" Set Up Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'



" Vundle Plugin Listing
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'vim-airline/vim-airline'



" Complete Vundle Setup
call vundle#end()
filetype plugin indent on
filetype plugin on



" General Configuration
set number
set noshowmode



" NerdTree
map <C-\> :NERDTreeToggle<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

