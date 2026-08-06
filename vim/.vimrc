" Set up Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Always show the status line
set laststatus=2

" Ensure UTF-8 encoding is enabled to render Powerline symbols correctly
set encoding=utf-8

" Enable syntax highlighting
syntax enable

" set solarized colour theme
set background=dark
colorscheme solarized

" Turn on line numbering
set number

" Display TABs as 3 spaces
set tabstop=3

" Highlight current line
set cursorline

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_,space:·
"set list

" Use relative line numbers
"if exists("&relativenumber")
"	set relativenumber
"	au BufReadPost * set relativenumber
"endif
