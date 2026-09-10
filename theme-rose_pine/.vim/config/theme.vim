set termguicolors

" Force 24-bit color inside tmux
if &term =~# 'tmux' || &term =~# 'screen'
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1

set background=dark
colorscheme rosepine
