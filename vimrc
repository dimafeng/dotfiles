set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ----- plugins
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'Shougo/vimproc.vim'
"Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
filetype plugin indent on
filetype plugin on

set number
set tabstop=4
set expandtab       "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=4    "Indent by 4 spaces when using >>, <<, == etc.
set softtabstop=4   "Indent by 4 spaces when pressing <TAB>

set autoindent      "Keep indentation from previous line
set smartindent     "Automatically inserts indentation in some cases
set cindent         "Like smartindent, but stricter and more customisable

set mouse=a

syntax on
color dracula

map <F5> :NERDTreeToggle<CR>

" Airline config
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

"
