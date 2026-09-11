# vim-airline themes for Noctis

One airline theme per Noctis colorscheme variant, generated from each
scheme's own palette (statusline/normal/visual/tabline colors, plus the
string/keyword/number/error accents) so the airline bar matches the editor
colors exactly.

| Colorscheme file        | Airline theme name |
|--------------------------|---------------------|
| noctis.vim               | `noctis`            |
| noctis-azureus.vim       | `noctis_azureus`    |
| noctis-bordo.vim         | `noctis_bordo`      |
| noctis-hibernus.vim      | `noctis_hibernus`   |
| noctis-lilac.vim         | `noctis_lilac`      |
| noctis-lux.vim           | `noctis_lux`        |
| noctis-minimus.vim       | `noctis_minimus`    |
| noctis-obscuro.vim       | `noctis_obscuro`    |
| noctis-sereno.vim        | `noctis_sereno`     |
| noctis-uva.vim           | `noctis_uva`        |
| noctis-viola.vim         | `noctis_viola`      |

(vim-airline theme names can't contain hyphens, so the `-` in each
colorscheme name becomes `_`.)

## Install

Drop the files into `autoload/airline/themes/` in your plugin path, e.g.
for a manual install:

```
~/.vim/autoload/airline/themes/noctis.vim
~/.vim/autoload/airline/themes/noctis_azureus.vim
...
```

With vim-plug, a personal fork/plugin dir works too, or just place them
under any directory already on `&runtimepath`.

Then in your vimrc, pick the matching theme for whichever Noctis variant
you have active, e.g.:

```vim
colorscheme noctis-azureus
let g:airline_theme = 'noctis_azureus'
```

If you'd rather have it follow your colorscheme automatically:

```vim
autocmd ColorScheme noctis*
      \ let g:airline_theme = substitute(expand('<amatch>'), '-', '_', 'g')
      \ | if exists('*airline#load_theme') | call airline#load_theme() | endif
```

## What each theme uses

- **Mode "a" section** — the colorscheme's `StatusLine` colors for Normal
  mode, and a mode-specific accent for Insert (String/green), Visual
  (Keyword/pink), and Replace (Error/red).
- **Mode "b"/"c" sections** — the colorscheme's `Visual`/`CursorLine` and
  `Normal` background/foreground.
- **Inactive / tabline** — the colorscheme's `TabLine` and `Comment` colors.
- **Modified-file indicator & accents** — the colorscheme's
  `Identifier`/`Constant` (orange), `Number` (violet), `Error` (red).

Each color also ships a computed xterm-256 fallback for terminal Vim
without truecolor support.
