# PS1, colors, and terminal prompt setup
# Also include any theme stuff... this is where we make stuff pretty

# load custom .dir_colors
eval "$(dircolors ~/.dir_colors)

[[ -f "$HOME/.bashrc.d/theme-eza.inc" ]] && source "$HOME/.bashrc.d/theme-eza.inc"
[[ -f "$HOME/.bashrc.d/theme-fzf.inc" ]] && source "$HOME/.bashrc.d/theme-fzf.inc"
[[ -f "$HOME/.bashrc.d/theme-bat.inc" ]] && source "$HOME/.bashrc.d/theme-bat.inc"

# Do host specific stuff                            
case "$(hostname)" in                               
   lomax)                                           
      source ~/.bashrc.d/`hostname`-prompt.inc     
      ;;                                            
   examplehost)                                 
      source ~/.bashrc.d/examplehost-prompt.inc
      ;;                                            
esac                                                
