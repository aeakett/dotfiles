# PS1, colors, and terminal prompt setup
# Also include any theme stuff... this is where we make stuff pretty

# load custom .dir_colors
[[ -f "$HOME/.dir_colors" ]] && eval "$(dircolors $HOME/.dir_colors)"

[[ -f "$HOME/.bashrc.d/theme-lscolors.inc" ]] && source "$HOME/.bashrc.d/theme-lscolors.inc"
[[ -f "$HOME/.bashrc.d/theme-eza.inc" ]] && source "$HOME/.bashrc.d/theme-eza.inc"
[[ -f "$HOME/.bashrc.d/theme-fzf.inc" ]] && source "$HOME/.bashrc.d/theme-fzf.inc"
[[ -f "$HOME/.bashrc.d/theme-bat.inc" ]] && source "$HOME/.bashrc.d/theme-bat.inc"
[[ -f "$HOME/.bashrc.d/theme-jq.inc" ]] && source "$HOME/.bashrc.d/theme-jq.inc"
[[ -f "$HOME/.bashrc.d/theme-duf.inc" ]] && source "$HOME/.bashrc.d/theme-duf.inc"
[[ -f "$HOME/.bashrc.d/theme-glow.inc" ]] && source "$HOME/.bashrc.d/theme-glow.inc"

# Do host specific stuff
if [ -f "$HOME/.bashrc.d/host-prompt.inc" ]; then
   source "$HOME/.bashrc.d/host-prompt.inc"
fi
