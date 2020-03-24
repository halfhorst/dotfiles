set history=50
set ruler
set nu
set hlsearch
set nocp
syntax on
filetype plugin indent on
set tabstop=4 shiftwidth=4 expandtab

" Pathogen pkg manager
execute pathogen#infect()

" Vim plug  pkg manager
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'ayu-theme/ayu-vim'
Plug 'ajmwagar/vim-deus'
Plug 'wakatime/vim-wakatime'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set termguicolors " temp help
let ayucolor="light"  " Can be light, dark or mirage
colorscheme brogrammer

" Configure vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

