# Command aliases

alias vi=vim
alias lazygit='lazygit --use-config-file="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/theme.yml"'

alias rbash='source ~/.bashrc'

alias_if_exists() {
    local replacement=$1
    local original=$2

    command -v "$replacement" >/dev/null 2>&1 || return

    alias "$original=$replacement"
    alias "o$original=command $original"
}

alias_if_exists duf df
alias_if_exists ncdu du
alias_if_exists btop top
alias_if_exists bat less
alias_if_exists eza ls
alias_if_exists rg grep
alias_if_exists fd find

# A bunch of 'ls' shortcuts
alias   ls='ls --color=auto'
alias    l='ls'
alias   la='ls -a'
alias   ll='ls -l'
alias  lla='ls -la'
alias  lal='ls -al'
alias  lsd='ls -l|grep "^d"'
alias lsda='ls -la|grep "^d"'

# eza aliases (this needs to come after the ls aliases above)
if command -v eza >/dev/null 2>&1; then
   alias ls='eza -F --group-directories-first --icons=auto --git --color-scale=all --time-style=long-iso'
   alias tree='eza --tree --icons=auto --color=auto'
	alias otree='command tree'
   alias lsd='ls -D'
   alias lsda='ls -Da'
fi

# Do host specific stuff
if [ -f "$HOME/.bashrc.d/host-aliases.inc" ]; then
   source "$HOME/.bashrc.d/host-aliases.inc"
fi
