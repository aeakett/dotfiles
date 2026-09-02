" Disable vi compatibility, if for some reason it's on.
set nocompatible

" Start searching before pressing enter.
set incsearch

" Ensure UTF-8 encoding is enabled to render Powerline symbols correctly
set encoding=utf-8

" Enable syntax highlighting
syntax enable

" Turn on line numbering
set number

" No tabs... 3 spaces!
set tabstop=3      " Visual width of a actual tab character
set shiftwidth=3   " Size of an indentation level in spaces
set expandtab      " Use spaces instead of tabs


" Highlight current line
set cursorline

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_,space:·
"set list

" Use relative line numbers
if exists("&relativenumber")
   set relativenumber
   au BufReadPost * set relativenumber
endif

" don't show mode on command line since we're using airline
set noshowmode

" Install vim-plug if needed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" List your plugins here
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin', 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'ryanoasis/vim-devicons'
call plug#end()
" https://github.com/junegunn/vim-plug
" :PlugInstall to install the plugins
" :PlugUpdate to install or update the plugins
" :PlugDiff to review the changes from the last update
" :PlugClean to remove plugins no longer in the list

" tell airline to use powerline symbols
let g:airline_powerline_fonts = 1

if filereadable(expand('~/.vim/config/theme.vim'))
   source ~/.vim/config/theme.vim
endif
