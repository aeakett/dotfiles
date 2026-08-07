# Set up Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bash/powerline.sh

# add bash completion
source /usr/share/bash-completion/bash_completion

# Load config pieces
if [ -d ~/.bashrc.d ]; then
  for file in ~/.bashrc.d/*.sh; do
    [ -r "$file" ] && . "$file"
  done
  unset file
fi

# fzf shell integration (needs to come after $PATH is set
eval "$(fzf --bash)"

# set up zoxide
eval "$(zoxide init bash)"
