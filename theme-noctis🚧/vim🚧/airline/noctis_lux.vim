" vim-airline theme: noctis_lux
" Auto-generated to match the "noctis-lux" colorscheme
" https://github.com/arcticlimer/djanho

let g:airline#themes#noctis_lux#palette = {}

function! airline#themes#noctis_lux#refresh()
endfunction

" [ guifg, guibg, ctermfg, ctermbg, opts ]
let s:accent_fg   = ['#f0e9d6',   224]
let s:accent_bg   = ['#0099ad',   31]
let s:base_fg     = ['#005661',     23]
let s:base_bg     = ['#fef8ec',     231]
let s:mid_bg      = ['#d8edeb',      194]
let s:muted_fg    = ['#8ca6a6',    109]
let s:inactive_bg = ['#f0e9d6', 224]
let s:green       = ['#00b368',       35]
let s:pink        = ['#ff5792',        204]
let s:violet      = ['#5842ff',      63]
let s:red         = ['#ff530f',         202]
let s:orange      = ['#fa8900',      208]

" Normal mode
let s:N1 = [ s:accent_fg[0], s:accent_bg[0], s:accent_fg[1], s:accent_bg[1], 'bold' ]
let s:N2 = [ s:base_fg[0],   s:mid_bg[0],    s:base_fg[1],   s:mid_bg[1],    '' ]
let s:N3 = [ s:base_fg[0],   s:base_bg[0],   s:base_fg[1],   s:base_bg[1],   '' ]
let g:airline#themes#noctis_lux#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#noctis_lux#palette.normal_modified = {
      \ 'airline_c': [ s:orange[0], s:base_bg[0], s:orange[1], s:base_bg[1], '' ],
      \ }

" Insert mode
let s:I1 = [ s:accent_fg[0], s:green[0], s:accent_fg[1], s:green[1], 'bold' ]
let g:airline#themes#noctis_lux#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:N3)
let g:airline#themes#noctis_lux#palette.insert_modified = {
      \ 'airline_c': [ s:orange[0], s:base_bg[0], s:orange[1], s:base_bg[1], '' ],
      \ }

" Replace mode
let s:R1 = [ s:accent_fg[0], s:red[0], s:accent_fg[1], s:red[1], 'bold' ]
let g:airline#themes#noctis_lux#palette.replace = airline#themes#generate_color_map(s:R1, s:N2, s:N3)
let g:airline#themes#noctis_lux#palette.replace_modified = g:airline#themes#noctis_lux#palette.normal_modified

" Visual mode
let s:V1 = [ s:accent_fg[0], s:pink[0], s:accent_fg[1], s:pink[1], 'bold' ]
let g:airline#themes#noctis_lux#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:N3)
let g:airline#themes#noctis_lux#palette.visual_modified = g:airline#themes#noctis_lux#palette.normal_modified

" Inactive
let s:IA = [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ]
let g:airline#themes#noctis_lux#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#noctis_lux#palette.inactive_modified = {
      \ 'airline_c': [ s:orange[0], s:inactive_bg[0], s:orange[1], s:inactive_bg[1], '' ],
      \ }

" Tabline
let g:airline#themes#noctis_lux#palette.tabline = {
      \ 'airline_tab':          [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ],
      \ 'airline_tab_selected': [ s:accent_bg[0], s:base_bg[0], s:accent_bg[1], s:base_bg[1], 'bold' ],
      \ 'airline_tabmod':       [ s:orange[0], s:inactive_bg[0], s:orange[1], s:inactive_bg[1], '' ],
      \ 'airline_tabmod_unsel': [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ],
      \ 'airline_tabfill':      [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ],
      \ 'airline_tabhid':       [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ],
      \ }

" CtrlP (optional integration)
let g:airline#themes#noctis_lux#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ s:accent_fg[0], s:accent_bg[0], s:accent_fg[1], s:accent_bg[1], '' ],
      \ [ s:base_fg[0],   s:mid_bg[0],    s:base_fg[1],   s:mid_bg[1],    '' ],
      \ [ s:accent_fg[0], s:violet[0],    s:accent_fg[1], s:violet[1],    '' ])

" Warning / Error accents
let g:airline#themes#noctis_lux#palette.accents = {
      \ 'red':    [ s:red[0], '', s:red[1], '', '' ],
      \ 'green':  [ s:green[0], '', s:green[1], '', '' ],
      \ 'blue':   [ s:violet[0], '', s:violet[1], '', '' ],
      \ 'yellow': [ s:orange[0], '', s:orange[1], '', '' ],
      \ 'orange': [ s:orange[0], '', s:orange[1], '', '' ],
      \ 'purple': [ s:pink[0], '', s:pink[1], '', '' ],
      \ }
