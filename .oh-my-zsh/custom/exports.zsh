# Make vim the default editor
export EDITOR="vim"
# Don.t clear the screen after quitting a manual page
export MANPAGER="less -X"
# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"







# do host-specific stuff
if [ -e $ZSH/custom/`uname -n`.exports ]; then
   source $ZSH/custom/`uname -n`.exports
fi
