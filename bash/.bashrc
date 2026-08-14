# Set up Powerline
#powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bash/powerline.sh
# Dynamically locate and source powerline.sh across different distros/locations
for _powerline_path in \
    /usr/share/powerline/bindings/bash/powerline.sh \
    /usr/share/powerline/bash/powerline.sh \
    /etc/bash_completion.d/powerline \
    "$HOME"/.local/lib/python3.*/site-packages/powerline/bindings/bash/powerline.sh \
    /usr/local/lib/python3.*/dist-packages/powerline/bindings/bash/powerline.sh \
    /opt/homebrew/opt/powerline-status/powerline/bindings/bash/powerline.sh \
    /usr/local/opt/powerline-status/powerline/bindings/bash/powerline.sh
do
    if [ -f "$_powerline_path" ]; then
        # Launch daemon if present to reduce prompt latency
        if command -v powerline-daemon >/dev/null 2>&1; then
            powerline-daemon -q
        fi
        source "$_powerline_path"
        break
    fi
done
unset _powerline_path

# add bash completion
source /usr/share/bash-completion/bash_completion

# Load config pieces
if [ -d ~/.bashrc.d ]; then
  for file in ~/.bashrc.d/*.sh; do
    [ -r "$file" ] && . "$file"
  done
  unset file
fi

# fzf shell integration (needs to come after $PATH is set)
eval "$(fzf --bash)"

# set up zoxide
eval "$(zoxide init --cmd cd bash)"

# see if there are any updates to our dotfiles
check_dotfiles_update
