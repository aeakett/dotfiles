# Path, exports, and environment variables

export PATH=$PATH:~/bin/:~/.local/bin/
export MANPATH="$HOME/.local/share/man:$MANPATH"
export EDITOR=vim

# Source fzf environment configuration if it exists
[ -f "$HOME/.config/fzf/fzf.env" ] && source "$HOME/.config/fzf/fzf.env"

# Start ssh-agent if not running
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
fi

# Do host specific stuff
case "$(hostname)" in
   lomax)
      source ~/.bashrc.d/`hostname`-env.sh
      ;;
   s-ssm-vdi151200)
      source ~/.bashrc.d/s-ssm-vdi151200-env.sh
      ;;
esac
