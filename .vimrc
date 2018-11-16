execute pathogen#infect()
syntax on
colorscheme apprentice
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab
set nu
set splitright
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:terraform_align=1
let mapleader=","
set timeout timeoutlen=1500
set nocp
set backspace=indent,eol,start

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

vmap '' :w !pbcopy<CR><CR>

