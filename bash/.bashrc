# Load config pieces
if [ -d ~/.bashrc.d ]; then
  for file in ~/.bashrc.d/*.sh; do
    [ -r "$file" ] && . "$file"
  done
  unset file
fi

# fzf shell integration (needs to come after $PATH is set)
eval "$(fzf --bash)"

# see if there are any updates to our dotfiles
check_dotfiles_update

# Start Starship
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# set up zoxide
eval "$(zoxide init --cmd cd bash)"
