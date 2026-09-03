# 🎨 Creating a Theme — The Field Guide

Themes give a consistent look-and-feel to a bunch of your command-line tools at once.

This document is the **primary source** on how themes are packaged, what each
theme can cover, which files are needed for every package, and how to roll your
own theme from scratch.

---

## 🧩 What is a theme?

A theme is just another **stow package**, named `theme-<name>` (for example
`theme-gruvbox`, `theme-catppuccin-mocha`, `theme-solarized`).

In this repo a theme is a **grab-bag** of coloured configuration files, spread
across whichever tools you care about. There is **no required package** — a
theme could contain a single file (even just `theme-jq.inc`) and still be a
perfectly valid theme.

The **one and only mandatory piece** of any theme is the state marker:

```text
.config/.dotTheme
```

This is a plain-text file holding the theme's name. It's what you check when
you've forgotten which theme you have stowed (`theme-README.md` points to it).
Everything else is optional.

> ⚠️ **Only stow one theme at a time.** Themes write to the same files and
> will stomp all over each other. To switch themes:
>
> ```bash
> stow -D theme-gruvbox
> stow theme-solarized
> ```

---

## 🔌 How a theme applies itself

A theme reaches your shell through **two mechanisms**:

### 1. Shell-environment `theme-*.inc` files 📜

The base `bash` package (`bash/.bashrc.d/30-prompt.sh`) auto-sources any
`~/.bashrc.d/theme-*.inc` files that exist. So a theme simply ships files into
`~/.bashrc.d/` to export colour env vars.

```bash
# 30-prompt.sh (from the base bash package)
[[ -f "$HOME/.bashrc.d/theme-lscolors.inc" ]] && source "$HOME/.bashrc.d/theme-lscolors.inc"
[[ -f "$HOME/.bashrc.d/theme-eza.inc"      ]] && source "$HOME/.bashrc.d/theme-eza.inc"
[[ -f "$HOME/.bashrc.d/theme-fzf.inc"      ]] && source "$HOME/.bashrc.d/theme-fzf.inc"
[[ -f "$HOME/.bashrc.d/theme-bat.inc"      ]] && source "$HOME/.bashrc.d/theme-bat.inc"
[[ -f "$HOME/.bashrc.d/theme-jq.inc"       ]] && source "$HOME/.bashrc.d/theme-jq.inc"
[[ -f "$HOME/.bashrc.d/theme-duf.inc"      ]] && source "$HOME/.bashrc.d/theme-duf.inc"
[[ -f "$HOME/.bashrc.d/theme-glow.inc"     ]] && source "$HOME/.bashrc.d/theme-glow.inc"
```

If a file isn't present, nothing breaks — the line is just skipped. **This is
what makes every piece optional.**

### 2. Application config drops 🗂️

For tools that read their own config files, a theme places files at the
tool's normal config path (`.config/...`, `.vim/...`, `.tmux/...`,
`~/.local/share/...`). Because these are real config files, they only need to
exist for the tools you actually want themed.

### 3. The state marker 🏷️

`.config/.dotTheme` records the active theme.

---

## 🌱 Step-by-step: create your own theme

1. **Clone the pattern.** Pick the closest existing theme and copy it:

   ```bash
   cp -r theme-gruvbox theme-myawesome
   ```

2. **Set your identifier.** Write your theme's name (the only required file):

   ```bash
   echo "myawesome" > theme-myawesome/.config/.dotTheme
   ```

3. **Keep only what you want.** Delete the files for tools you don't care
   about. A theme with just `theme-fzf.inc` is fine. A theme with everything
   is fine too.

4. **Edit the colours** in the files you kept (see the 📦 reference below).

5. **Stow it:**

   ```bash
   stow -D theme-gruvbox   # remove the old theme first
   stow theme-myawesome
   ```

6. **Bounce your shell** so the `theme-*.inc` files load:

   ```bash
   exec bash   # or open a new terminal
   ```

7. **Note:** for `mc` and `btop` you must select the theme inside the app the
   first time you run it (`theme-README.md`).

---

## 📦 Package reference

Below is every tool a theme may cover, the **exact file(s) it needs**, and
what goes inside. Files grouped by how they're applied.

### Shell env vars (`~/.bashrc.d/`)

These are sourced by `30-prompt.sh`. Each one must exist exactly where shown.

| Package | File in theme | Required content | Example |
|---|---|---|---|
| **fzf** | `.bashrc.d/theme-fzf.inc` | `export FZF_DEFAULT_OPTS="..."` with `--color=` opts | `export FZF_DEFAULT_OPTS="--color=fg:#ebdbb2,bg:#282828,hl:#fabd2f ..."` |
| **bat** | `.bashrc.d/theme-bat.inc` | `export BAT_THEME="<bat theme name>"` | `export BAT_THEME="gruvbox-dark"` |
| **jq** | `.bashrc.d/theme-jq.inc` | `export JQ_COLORS='<colour codes>'` | `export JQ_COLORS='0;90:0;31:0;32:0;91:0;33:0;37:0;95:0;34'` |
| **glow** | `.bashrc.d/theme-glow.inc` | `alias glow="glow -s $HOME/.config/glow/theme.json"` | see left (requires the `.config/glow/theme.json` drop below) |
| **eza** | `.bashrc.d/theme-eza.inc` | `unset LS_COLORS` | `unset LS_COLORS` |
| **LS_COLORS** | `.bashrc.d/theme-lscolors.inc` | `export LS_COLORS="..."` (often `vivid`-generated) | `export LS_COLORS="*~=3;38;2;102;92;84:..."` |
| **duf** | `.bashrc.d/theme-duf.inc` | a `duf` alias / env | `alias duf='duf --theme=light'` |

### Application config drops (`~/.config/`, `~/.vim/`, `~/.tmux/`, …)

| Package | File in theme | What goes inside |
|---|---|---|
| **starship** | `.config/starship.toml` | Full prompt with a `[palettes]` block + powerline segments (needs a Nerd Font) |
| **eza** | `.config/eza/theme.yml` | eza's theme file (file-type colours) |
| **lazygit** | `.config/lazygit/theme.yml` | lazygit GUI colours (merged with base `config.yml` via the `lazygit` alias) |
| **glow** | `.config/glow/theme.json` | Glamour style JSON (markdown element colours) |
| **yazi** | `.config/yazi/flavors/theme.yazi/flavor.toml` (+ `tmtheme.xml`) | A yazi flavor; the heaviest file. `tmtheme.xml` gives syntax highlighting |
| **bat** 🎨 | `.config/bat/themes/<Name>.tmTheme` | Ships the actual syntax theme file so `BAT_THEME` resolves |
| **btop** | `.config/btop/themes/<name>.theme` | btop theme file |
| **mc** | `.local/share/mc/skins/<name>.ini` | Midnight Commander skin |
| **ncdu** | `.config/ncdu/config` | e.g. `--color dark-bg` |
| **dircolors** | `.dir_colors` | Alternative / complement to `LS_COLORS` (loaded by `30-prompt.sh` via `dircolors`) |
| **tmux** | `.tmux/custom_themes/custom_theme.conf` | See tmux styles below |
| **vim** | `.vim/config/theme.vim` | See vim styles below |

#### tmux — two accepted styles

- **Full override** (what `gruvbox`/`solarized` do): set every `@thm_*` variable
  that the catppuccin tmux plugin reads:

  ```tmux
  set -ogq @thm_bg      "#32302f"
  set -ogq @thm_fg      "#ebdbb2"
  set -ogq @thm_red     "#cc241d"
  # ...etc for every surface/overlay colour
  ```

- **Built-in palette** (what the catppuccin themes do): just pick a flavour and
  let the plugin provide everything:

  ```tmux
  set -g @catppuccin_flavor latte
  ```

#### vim — the standard shape

```vim
set background=dark
colorscheme gruvbox
```

Catppuccin variants add 24-bit/tmux true-colour handling:

```vim
set termguicolors
if &term =~# 'tmux' || &term =~# 'screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
colorscheme catppuccin_latte
```

---

## 🗺️ Coverage of the bundled themes

This shows what the existing themes actually ship, so you can copy the pattern
that fits your goal.

| Package | gruvbox | solarized | cat-latte | cat-frappe | cat-macchiato | cat-mocha |
|---|:-:|:-:|:-:|:-:|:-:|:-:|
| `.dotTheme` (required) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| fzf | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| eza | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| LS_COLORS | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| bat (env only) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| jq | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| glow | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| starship | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| lazygit | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| yazi | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| tmux | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| vim | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| dircolors (`.dir_colors`) | ✅ | ✅ | — | — | — | — |
| bat (ships `.tmTheme`) | — | — | ✅ | ✅ | ✅ | ✅ |
| btop | — | — | ✅ | ✅ | ✅ | ✅ |
| mc skin | — | — | ✅ | ✅ | ✅ | ✅ |
| ncdu | — | — | ✅ | — | — | — |
| duf | — | — | ✅ | — | — | — |

**Observations that shape new themes:**
- `gruvbox` & `solarized` are **lean core** themes (shell-env + common tools +
  dircolors), relying on system-installed bat themes by name.
- The **catppuccin** variants go further and **ship** the bat theme file, plus
  btop and a mc skin.
- `catppuccin-latte` is the most complete — it's the **only** one with ncdu and
  a duf theme (fitting, since latte is the light variant).

---

## ⚠️ Conventions & gotchas

- **One theme at a time.** Always `stow -D` the current theme before stowing a
  new one.
- **`.gitignore`** already excludes plugin dirs, so a theme should **not**
  track them:
  ```text
  /theme-*/.vim/autoload/plug.vim
  /theme-*/.vim/plugged
  ```
- Some tools have **no base package** and are themed *only* via the theme:
  `eza`, `starship`, `ncdu`, `duf`. A theme providing these files is the only
  way they get configured.
- **Coexisting base packages:** the base `mc` package ships
  `~/.config/mc/{ini,panels.ini}` (different path from the theme's skin — they
  coexist); the base `btop` package has an empty `themes/` dir; the base
  `lazygit/config.yml` is empty and the theme's `theme.yml` is merged in
  through the `lazygit` alias.
- **Nerd Font required** for the icon glyphs used in starship / tmux configs.
- `theme-glow.inc` exists because the glow config file can't expand `$HOME`,
  and `GLAMOUR_STYLE` only affects the TUI — **not** `glow <file>.md`. The
  alias is the workaround.

---

## ✅ New-theme checklist

- [ ] `theme-<name>/` exists as a stow package directory
- [ ] `.config/.dotTheme` contains the theme name (the only required file)
- [ ] Includes `theme-*.inc` files for every shell-env tool you want
- [ ] Includes a `.config/...` (or `.vim`, `.tmux`, skin) drop for every app
- [ ] `.vim/`, `.tmux/` plugin artefacts are **not** committed
- [ ] `stow -D <old-theme>` then `stow theme-<name>`
- [ ] Reloaded the shell; ran `mc`/`btop` once to select the theme in-app
- [ ] `cat ~/.config/.dotTheme` shows the expected name
