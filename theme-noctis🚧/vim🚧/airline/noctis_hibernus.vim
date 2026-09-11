" vim-airline theme: noctis_hibernus
" Auto-generated to match the "noctis-hibernus" colorscheme
" https://github.com/arcticlimer/djanho

let g:airline#themes#noctis_hibernus#palette = {}

function! airline#themes#noctis_hibernus#refresh()
endfunction

" [ guifg, guibg, ctermfg, ctermbg, opts ]
let s:accent_fg   = ['#caedf2',   195]
let s:accent_bg   = ['#0099ad',   31]
let s:base_fg     = ['#005661',     23]
let s:base_bg     = ['#f4f6f6',     255]
let s:mid_bg      = ['#d2ecf0',      195]
let s:muted_fg    = ['#8ca6a6',    109]
let s:inactive_bg = ['#caedf2', 195]
let s:green       = ['#00b368',       35]
let s:pink        = ['#ff5792',        204]
let s:violet      = ['#5842ff',      63]
let s:red         = ['#ff530f',         202]
let s:orange      = ['#fa8900',      208]

" Normal mode
let s:N1 = [ s:accent_fg[0], s:accent_bg[0], s:accent_fg[1], s:accent_bg[1], 'bold' ]
let s:N2 = [ s:base_fg[0],   s:mid_bg[0],    s:base_fg[1],   s:mid_bg[1],    '' ]
let s:N3 = [ s:base_fg[0],   s:base_bg[0],   s:base_fg[1],   s:base_bg[1],   '' ]
let g:airline#themes#noctis_hibernus#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#noctis_hibernus#palette.normal_modified = {
      \ 'airline_c': [ s:orange[0], s:base_bg[0], s:orange[1], s:base_bg[1], '' ],
      \ }

" Insert mode
let s:I1 = [ s:accent_fg[0], s:green[0], s:accent_fg[1], s:green[1], 'bold' ]
let g:airline#themes#noctis_hibernus#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:N3)
let g:airline#themes#noctis_hibernus#palette.insert_modified = {
      \ 'airline_c': [ s:orange[0], s:base_bg[0], s:orange[1], s:base_bg[1], '' ],
      \ }

" Replace mode
let s:R1 = [ s:accent_fg[0], s:red[0], s:accent_fg[1], s:red[1], 'bold' ]
let g:airline#themes#noctis_hibernus#palette.replace = airline#themes#generate_color_map(s:R1, s:N2, s:N3)
let g:airline#themes#noctis_hibernus#palette.replace_modified = g:airline#themes#noctis_hibernus#palette.normal_modified

" Visual mode
let s:V1 = [ s:accent_fg[0], s:pink[0], s:accent_fg[1], s:pink[1], 'bold' ]
let g:airline#themes#noctis_hibernus#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:N3)
let g:airline#themes#noctis_hibernus#palette.visual_modified = g:airline#themes#noctis_hibernus#palette.normal_modified

" Inactive
let s:IA = [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ]
let g:airline#themes#noctis_hibernus#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#noctis_hibernus#palette.inactive_modified = {
      \ 'airline_c': [ s:orange[0], s:inactive_bg[0], s:orange[1], s:inactive_bg[1], '' ],
      \ }

" Tabline
let g:airline#themes#noctis_hibernus#palette.tabline = {
      \ 'airline_tab':          [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ],
      \ 'airline_tab_selected': [ s:accent_bg[0], s:base_bg[0], s:accent_bg[1], s:base_bg[1], 'bold' ],
      \ 'airline_tabmod':       [ s:orange[0], s:inactive_bg[0], s:orange[1], s:inactive_bg[1], '' ],
      \ 'airline_tabmod_unsel': [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ],
      \ 'airline_tabfill':      [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ],
      \ 'airline_tabhid':       [ s:muted_fg[0], s:inactive_bg[0], s:muted_fg[1], s:inactive_bg[1], '' ],
      \ }

" CtrlP (optional integration)
let g:airline#themes#noctis_hibernus#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ s:accent_fg[0], s:accent_bg[0], s:accent_fg[1], s:accent_bg[1], '' ],
      \ [ s:base_fg[0],   s:mid_bg[0],    s:base_fg[1],   s:mid_bg[1],    '' ],
      \ [ s:accent_fg[0], s:violet[0],    s:accent_fg[1], s:violet[1],    '' ])

" Warning / Error accents
let g:airline#themes#noctis_hibernus#palette.accents = {
      \ 'red':    [ s:red[0], '', s:red[1], '', '' ],
      \ 'green':  [ s:green[0], '', s:green[1], '', '' ],
      \ 'blue':   [ s:violet[0], '', s:violet[1], '', '' ],
      \ 'yellow': [ s:orange[0], '', s:orange[1], '', '' ],
      \ 'orange': [ s:orange[0], '', s:orange[1], '', '' ],
      \ 'purple': [ s:pink[0], '', s:pink[1], '', '' ],
      \ }
