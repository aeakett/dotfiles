# Path, exports, and environment variables

export PATH=$PATH:~/bin/

# Start ssh-agent if not running
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
fi
