# use a bare-bones config file without all the fancy theme stuff

if command -v eza >/dev/null 2>&1; then
   alias tmux='tmux -f ~/.config/.tmux.conf.basic'
fi
