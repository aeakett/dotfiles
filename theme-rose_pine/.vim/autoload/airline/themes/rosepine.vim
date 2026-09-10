" AirlineTheme: Rose Pine
" Ported from the rose-pine/vim lightline colorscheme
" https://github.com/rose-pine/vim/blob/main/autoload/lightline/colorscheme/rosepine.vim

let g:airline#themes#rosepine#palette = {}

" -- Rose Pine palette: [guicolor, ctermcolor] --
let s:base    = [ '#191724', 234 ]
let s:surface = [ '#1f1d2e', 234 ]
let s:overlay = [ '#26233a', 235 ]
let s:muted   = [ '#6e6a86', 60  ]
let s:subtle  = [ '#908caa', 103 ]
let s:text    = [ '#e0def4', 189 ]
let s:love    = [ '#eb6f92', 204 ]
let s:gold    = [ '#f6c177', 222 ]
let s:rose    = [ '#ebbcba', 181 ]
let s:pine    = [ '#31748f', 31  ]
let s:foam    = [ '#9ccfd8', 152 ]
let s:iris    = [ '#c4a7e7', 183 ]

" -- Normal mode --
let s:N1 = [ s:base[0],    s:rose[0],    s:base[1],    s:rose[1],    'bold' ]
let s:N2 = [ s:text[0],    s:overlay[0], s:text[1],    s:overlay[1], ''     ]
let s:N3 = [ s:text[0],    s:surface[0], s:text[1],    s:surface[1], ''     ]
let g:airline#themes#rosepine#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let g:airline#themes#rosepine#palette.normal_modified = {
      \ 'airline_c': [ s:gold[0], s:surface[0], s:gold[1], s:surface[1], '' ],
      \ }

" -- Insert mode --
let s:I1 = [ s:base[0],    s:pine[0],    s:base[1],    s:pine[1],    'bold' ]
let s:I2 = [ s:text[0],    s:overlay[0], s:text[1],    s:overlay[1], ''     ]
let s:I3 = [ s:text[0],    s:surface[0], s:text[1],    s:surface[1], ''     ]
let g:airline#themes#rosepine#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let g:airline#themes#rosepine#palette.insert_modified = {
      \ 'airline_c': [ s:gold[0], s:surface[0], s:gold[1], s:surface[1], '' ],
      \ }

" -- Replace mode --
let s:R1 = [ s:base[0],    s:love[0],    s:base[1],    s:love[1],    'bold' ]
let s:R2 = [ s:text[0],    s:overlay[0], s:text[1],    s:overlay[1], ''     ]
let s:R3 = [ s:text[0],    s:surface[0], s:text[1],    s:surface[1], ''     ]
let g:airline#themes#rosepine#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#rosepine#palette.replace_modified = deepcopy(g:airline#themes#rosepine#palette.normal_modified)

" -- Visual mode --
let s:V1 = [ s:base[0],    s:gold[0],    s:base[1],    s:gold[1],    'bold' ]
let s:V2 = [ s:text[0],    s:overlay[0], s:text[1],    s:overlay[1], ''     ]
let s:V3 = [ s:text[0],    s:surface[0], s:text[1],    s:surface[1], ''     ]
let g:airline#themes#rosepine#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#rosepine#palette.visual_modified = deepcopy(g:airline#themes#rosepine#palette.normal_modified)

" -- Inactive windows --
let s:IA1 = [ s:overlay[0], s:surface[0], s:overlay[1], s:surface[1], '' ]
let s:IA2 = [ s:overlay[0], s:surface[0], s:overlay[1], s:surface[1], '' ]
let s:IA3 = [ s:overlay[0], s:surface[0], s:overlay[1], s:surface[1], '' ]
let g:airline#themes#rosepine#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" -- Terminal mode (maps to insert-like pine accent) --
let g:airline#themes#rosepine#palette.terminal = deepcopy(g:airline#themes#rosepine#palette.insert)

" -- Warnings / errors (used in section c / gutter) --
let g:airline#themes#rosepine#palette.accents = {
      \ 'red':   [ s:love[0], '', s:love[1], '' ],
      \ }

" -- CtrlP extension --
if get(g:, 'loaded_ctrlp', 0)
  let g:airline#themes#rosepine#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
        \ [ s:base[0], s:rose[0],    s:base[1], s:rose[1],    'bold' ],
        \ [ s:text[0], s:overlay[0], s:text[1], s:overlay[1], ''     ],
        \ [ s:base[0], s:foam[0],    s:base[1], s:foam[1],    'bold' ])
endif

" -- Tabline --
let g:airline#themes#rosepine#palette.tabline = {
      \ 'airline_tab':          [ s:base[0],  s:overlay[0], s:base[1],  s:overlay[1], ''     ],
      \ 'airline_tabsel':       [ s:base[0],  s:iris[0],    s:base[1],  s:iris[1],    'bold' ],
      \ 'airline_tabtype':      [ s:base[0],  s:subtle[0],  s:base[1],  s:subtle[1],  ''     ],
      \ 'airline_tabfill':      [ s:subtle[0], s:surface[0], s:subtle[1], s:surface[1], ''   ],
      \ 'airline_tabmod':       [ s:base[0],  s:gold[0],    s:base[1],  s:gold[1],    'bold' ],
      \ 'airline_tabhid':       [ s:overlay[0], s:surface[0], s:overlay[1], s:surface[1], '' ],
      \ }
