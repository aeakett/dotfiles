# Path, exports, and environment variables

# add bash completion
source /usr/share/bash-completion/bash_completion

export PATH=$PATH:~/bin/:~/.local/bin/
export MANPATH="$HOME/.local/share/man:$MANPATH"
export EDITOR=vim
export VISUAL=vim
# Set man pager
if command -v bat > /dev/null 2>&1; then
   export MANPAGER="bat -l man -p"
elif command -v batcat > /dev/null 2>&1; then
   export MANPAGER="batcat -l man -p"
fi


export EZA_CONFIG_DIR="$HOME/.config/eza"

# Source fzf environment configuration if it exists
[ -f "$HOME/.config/fzf/fzf.env" ] && source "$HOME/.config/fzf/fzf.env"

# Start ssh-agent if not running
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
fi

# Do host specific stuff
case "$(hostname)" in
   lomax)
      source ~/.bashrc.d/`hostname`-env.inc
      ;;
   s-ssm-vdi151200)
      source ~/.bashrc.d/s-ssm-vdi151200-env.inc
      ;;
esac
