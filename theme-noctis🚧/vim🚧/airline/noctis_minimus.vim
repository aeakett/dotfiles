" vim-airline theme: noctis_minimus
" Auto-generated to match the "noctis-minimus" colorscheme
" https://github.com/arcticlimer/djanho

let g:airline#themes#noctis_minimus#palette = {}

function! airline#themes#noctis_minimus#refresh()
endfunction

" [ guifg, guibg, ctermfg, ctermbg, opts ]
let s:accent_fg   = ['#1b2932',   17]
let s:accent_bg   = ['#496d83',   60]
let s:base_fg     = ['#c5cdd3',     188]
let s:base_bg     = ['#1b2932',     17]
let s:mid_bg      = ['#2a3f4d',      23]
let s:muted_fg    = ['#5e7887',    66]
let s:inactive_bg = ['#202e37', 17]
let s:green       = ['#72c09f',       73]
let s:pink        = ['#c88da2',        175]
let s:violet      = ['#7068b1',      61]
let s:red         = ['#b16a4e',         131]
let s:orange      = ['#d3b692',      180]

" Normal mode
let s:N1 = [ s:accent_fg[0], s:accent_bg[0], s:accent_fg[1], s:accent_bg[1], 'bold' ]
let s:N2 = [ s:base_fg[0],   s:mid_bg[0],    s:base_fg[1],   s:mid_bg[1],    '' ]
let s:N3 = [ s:base_fg[0],   s:base_bg[0],   s:base_fg[1],   s:base_bg[1],   '' ]
let g:airline#themes#noctis_minimus#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#noctis_minimus#palette.normal_modified = {
      \ 'airline_c': [ s:orange[0], s:base_bg[0], s:orange[1], s:base_bg[1], '' ],
      \ }

" Insert mode
let s:I1 = [ s:accent_fg[0], s:green[0], s:accent_fg[1], s:green[1], 'bold' ]
let g:airline#themes#noctis_minimus#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:N3)
let g:airline#themes#noctis_minimus#palette.insert_modified = {
      \ 'airline_c': [ s:orange[0], s:base_bg[0], s:orange[1], s:base_bg[1], '' ],
      \ }

" Replace mode
let s:R1 = [ s:accent_fg[0], s:red[0], s:accent_fg[1], s:red[1], 'bold' ]
let g:airline#themes#noctis_minimus#palette.replace = airline#themes#generate_color_map(s:R1, s:N2, s:N3)
let g:airline#themes#noctis_minimus#palette.replace_modified = g:airline#themes#noctis_minimus#palette.normal_modified

" Visual mode
let s:V1 = [ s:accent_fg[0], s:pink[0], s:accent_fg[1], s:pink[1], 'bold' ]
let g:airline#themes#noctis_minimus#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:N3)
let g:airline#themes#noctis_minimus#palette.visual_modified = g:airline#themes#noctis_minimus#palette.normal_modified

" Inactive
let s:IA = [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ]
let g:airline#themes#noctis_minimus#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#noctis_minimus#palette.inactive_modified = {
      \ 'airline_c': [ s:orange[0], s:inactive_bg[0], s:orange[1], s:inactive_bg[1], '' ],
      \ }

" Tabline
let g:airline#themes#noctis_minimus#palette.tabline = {
      \ 'airline_tab':          [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ],
      \ 'airline_tab_selected': [ s:accent_bg[0], s:base_bg[0], s:accent_bg[1], s:base_bg[1], 'bold' ],
      \ 'airline_tabmod':       [ s:orange[0], s:inactive_bg[0], s:orange[1], s:inactive_bg[1], '' ],
      \ 'airline_tabmod_unsel': [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ],
      \ 'airline_tabfill':      [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ],
      \ 'airline_tabhid':       [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ],
      \ }

" CtrlP (optional integration)
let g:airline#themes#noctis_minimus#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ s:accent_fg[0], s:accent_bg[0], s:accent_fg[1], s:accent_bg[1], '' ],
      \ [ s:base_fg[0],   s:mid_bg[0],    s:base_fg[1],   s:mid_bg[1],    '' ],
      \ [ s:accent_fg[0], s:violet[0],    s:accent_fg[1], s:violet[1],    '' ])

" Warning / Error accents
let g:airline#themes#noctis_minimus#palette.accents = {
      \ 'red':    [ s:red[0], '', s:red[1], '', '' ],
      \ 'green':  [ s:green[0], '', s:green[1], '', '' ],
      \ 'blue':   [ s:violet[0], '', s:violet[1], '', '' ],
      \ 'yellow': [ s:orange[0], '', s:orange[1], '', '' ],
      \ 'orange': [ s:orange[0], '', s:orange[1], '', '' ],
      \ 'purple': [ s:pink[0], '', s:pink[1], '', '' ],
      \ }
