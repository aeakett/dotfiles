# extract most archives with one command
# (also corrals the contents of files that are known to be tarbombs)
extract () {
   if [ -f $1 ] ; then
      case $1 in
         *.tar.bz2)   tar xvjf $1     ;;
         *.tar.gz)    tar xvzf $1     ;;
         *.tar)       tar xvf $1      ;;
         *.tgz)       tar xvzf $1     ;;
         *.tbz2)      tar xvjf $1     ;;
         *.gz)        gunzip $1      ;;
         *.bz2)       bunzip2 $1     ;;
         *.rar)       unrar e $1     ;;
         *.zip)       unzip $1       ;;
         *.Z)         uncompress $1  ;;
         *.7z)        7z x $1        ;;
         *.cbr)       mkdir $1-extracted; cd $1-extracted; cp ../$1 ./; unrar e $1; rm $1; cd ..     ;;
         *.cbz)       mkdir $1-extracted; cd $1-extracted; cp ../$1 ./; unzip $1; rm $1; cd ..       ;;
         *.cb7)       mkdir $1-extracted; cd $1-extracted; cp ../$1 ./; 7z x $1; rm $1; cd ..        ;;
         *.jar)       mkdir $1-extracted; cd $1-extracted; cp ../$1 ./; unzip $1; rm $1; cd ..       ;;
         *.epub)      mkdir $1-extracted; cd $1-extracted; cp ../$1 ./; unzip $1; rm $1; cd ..       ;;
			*.dmg)       hdiutil mount $1 ;;
         *)           echo "'$1' cannot be extracted via extract()" ;;
      esac
   else
      echo "'$1' is not a valid file"
   fi
}

# Create a new directory and enter it
function mcd() {
   mkdir -p "$@" && cd "$@"
}

# Use Git.s colored diff when available
hash git &>/dev/null
if [ $? -eq 0 ]; then
   function diff() {
      git diff --no-index --color-words "$@"
   }
fi

# Create a data URL from an image (works for other file types too, if you tweak the Content-Type afterwards)
dataurl() {
   echo "data:image/${1##*.};base64,$(openssl base64 -in "$1")" | tr -d '\n'
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
   local port="${1:-8000}"
   open "http://localhost:${port}/"
   # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
   # And serve everything as UTF-8 (although not technically correct, this doesn.t break anything for binary files)
   python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# Test if HTTP compression (RFC 2616 + SDCH) is enabled for a given URL.
# Send a fake UA string for sites that sniff it instead of using the Accept-Encoding header. (Looking at you, ajax.googleapis.com!)
function httpcompression() {
   encoding="$(curl -LIs -H 'User-Agent: Mozilla/5 Gecko' -H 'Accept-Encoding: gzip,deflate,compress,sdch' "$1" | grep '^Content-Encoding:')" && echo "$1 is encoded using ${encoding#* }" || echo "$1 is not using any encoding"
}

# Gzip-enabled `curl`
function gurl() {
   curl -sH "Accept-Encoding: gzip" "$@" | gunzip
}

# Syntax-highlight JSON strings or files
function json() {
   if [ -p /dev/stdin ]; then
      # piping, e.g. `echo '{"foo":42}' | json`
      python -mjson.tool | pygmentize -l javascript
   else
      # e.g. `json '{"foo":42}'`
      python -mjson.tool <<< "$*" | pygmentize -l javascript
   fi
}

# All the dig info
function digga() {
   dig +nocmd "$1" any +multiline +noall +answer
}

# Escape UTF-8 characters into their 3-byte format
function escape() {
   printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
   echo # newline
}

# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
   perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
   echo # newline
}

# Get a character.s Unicode code point
function codepoint() {
   perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))"
   echo # newline
}




















# do host-specific stuff
if [ -e $ZSH/custom/`uname -n`.functions ]; then
   source $ZSH/custom/`uname -n`.functions
fi
