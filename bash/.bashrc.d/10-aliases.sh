# Command aliases

alias vi=vim

# List only directories
alias lsd='ls -l | grep "^d"'
# other ls shortcuts
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lal='ls -al'

# Restart/reload Powerline daemon
alias powerline-reload='powerline-daemon --replace'

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
alias   l='ls --color=auto'
alias  la='ls --color=auto -a'
alias  ll='ls --color=auto -l'
alias lla='ls --color=auto -la'
alias lal='ls --color=auto -al'
alias lsd='ls -l|grep "^d"'

# eza aliases
if command -v eza >/dev/null 2>&1; then
   alias ls='eza -F --group-directories-first --icons=auto --color=auto --git --color-scale=all --time-style=long-iso'
   alias tree='eza --tree --icons=auto --color=auto'
   alias lsd='ls -D'
   alias lsda='ls -Da'
fi

# fzf aliases
if command -v fzf >/dev/null 2>&1; then
   alias fvi='vim $(fzf)'
	alias fless='less $(fzf)'
fi

# Do host specific stuff
case "$(hostname)" in
   lomax)
      source ~/.bashrc.d/`hostname`-aliases.inc
      ;;
   examplehost)
      source ~/.bashrc.d/examplehost-aliases.inc
      ;;
esac
