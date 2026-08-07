# Command aliases

alias vi=vim

# List only directories
alias lsd='ls -l | grep "^d"'

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
