# we have to apply the theme this way because the config file won't expand $HOME, and setting GLAMOUR_STYLE only affects the TUI and not `glow foo.md`
alias glow="glow -s $HOME/.config/glow/theme.json"
