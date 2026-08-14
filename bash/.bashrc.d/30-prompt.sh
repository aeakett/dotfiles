# PS1, colors, and terminal prompt setup
# Also include any theme stuff... this is where we make stuff pretty

[[ -f "$HOME/.bashrc.d/theme-eza.inc" ]] && source "$HOME/.bashrc.d/theme-eza.inc"
[[ -f "$HOME/.bashrc.d/theme-fzf.inc" ]] && source "$HOME/.bashrc.d/theme-fzf.inc"
[[ -f "$HOME/.bashrc.d/theme-bat.inc" ]] && source "$HOME/.bashrc.d/theme-bat.inc"

# Do host specific stuff                            
case "$(hostname)" in                               
   lomax)                                           
      source ~/.bashrc.d/`hostname`-prompt.inc     
      ;;                                            
   s-ssm-vdi151200)                                 
      source ~/.bashrc.d/s-ssm-vdi151200-prompt.inc
      ;;                                            
esac                                                
