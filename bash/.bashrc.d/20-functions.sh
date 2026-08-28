# Custom shell functions

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

# list the contents of various archives
archlist () {
   if [ -f $1 ]
   then
      case $1 in
         (*.zip) unzip -l $1 ;;
         (*.epub) unzip -l $1 ;;
         (*.jar) unzip -l $1 ;;
         (*.cbz) unzip -l $1 ;;
         (*.tar) tar tf $1 ;;
         (*.tar.bz2) bzcat $1|tar tf - ;;
         (*.tbz2) bzcat $1|tar tf - ;;
         (*.tar.gz) zcat $1|tar tf - ;;
         (*.tgz) zcat $1|tar tf - ;;
         (*.rar) unrar t $1 ;;
         (*.cbr) unrar t $1 ;;
         (*.7z) 7z l $1 ;;
         (*.cb7) 7z l $1 ;;
         (*) echo "'$1' cannot be viewed via archlist()" ;;
      esac
   else
      echo "'$1' is not a valid file"
   fi
}

# Create a new directory and enter it
function mcd() {
   mkdir -p "$@" && cd "$@"
}

# resize images (via Smashing Magazine: http://www.smashingmagazine.com/2015/06/25/efficient-image-resizing-with-imagemagick/)
# usage smartresize inputfile.png 300 outputdir/ (the number can be a width in pixels, or a percentage)
smartresize() {
   mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

# Do host specific stuff                   
if [ -f "$HOME/.bashrc.d/host-functions.inc" ]; then
   source "$HOME/.bashrc.d/host-functions.inc"
fi
