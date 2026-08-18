# Load config pieces
if [ -d ~/.bashrc.d ]; then
  for file in ~/.bashrc.d/*.sh; do
    [ -r "$file" ] && . "$file"
  done
  unset file
fi

# fzf shell integration (needs to come after $PATH is set)
if command -v fzf &> /dev/null; then
   eval "$(fzf --bash)"
fi

# see if there are any updates to our dotfiles
check_dotfiles_update

# Start Starship
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# set up zoxide
if command -v zoxide &> /dev/null; then
   eval "$(zoxide init --cmd cd bash)"
fi
