# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
   alias ls="command ls -G"
else
   alias ls="command ls --color"
   eval `dircolors ~/.dir_colors`
fi

# Show/hide hidden files in Finder
alias showhidden="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hidehidden="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

#convert rgb color to hex value
alias rgb2hex='printf "#%.2x%.2x%.2x\n" $(1) $(2) $(3)'

#decimal to hex
alias dec2hex='printf "%x\n" $1'

#hex to decimal
alias hex2dec='printf "%d\n" 0x$1'

# List only directories
alias lsd='ls -l | grep "^d"'

alias vi="vim"

# Enable aliases to be sudo.ed
alias sudo='sudo '

# Get OS X Software Updates, update Homebrew itself, and upgrade installed Homebrew packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# File size
alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple.s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# PlistBuddy alias, because sometimes `defaults` just doesn.t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# One of @janmoesen.s ProTip.s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
   alias "$method"="lwp-request -m '$method'"
done

# Use cdf of it's installed (https://github.com/aeakett/cdf)
if [ -e ~/bin/cdf ]
then
   alias df="cdf -h"
else
   alias df="df -h"
fi

# Use personal version of vim if available
if [ -e ~/bin/zsh ]
then
   alias vim="~/bin/vim"
   alias vi="~/bin/vim"
fi

# make sure to start tmux in UTF mode
alias tmux="tmux -u"



# do host-specific stuff
if [ -e $ZSH/custom/`uname -n`.aliases ]; then
   source $ZSH/custom/`uname -n`.aliases
fi
