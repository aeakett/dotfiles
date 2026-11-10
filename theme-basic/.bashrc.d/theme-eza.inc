# redefine aliases to not use icons

if command -v eza >/dev/null 2>&1; then
   alias ls='eza -F --group-directories-first --icons=never --git --color-scale=all --time-style=long-iso -g'
   alias tree='eza --tree --icons=never --color=auto'
   alias otree='command tree'
   alias lsd='ls -D'
   alias lsda='ls -Da'
fi
