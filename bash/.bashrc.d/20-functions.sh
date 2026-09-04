# Custom shell functions

# extract most archives with one command
# (also corrals the contents of files that are known to be tarbombs)
extract () {
    if [ -f "$1" ]; then
        local archive_file="$1"
        local archive_basename=$(basename "$archive_file")
        local archive_name="${archive_basename%.*}"
        
        # Remove .tar if present to get a clean name for directory
        if [[ "$archive_name" == *.tar ]]; then
            archive_name="${archive_name%.*}"
        fi

        local num_top_level_entries=0
        local requires_extracted_dir=false
        local output_dir=""

        case "$archive_file" in
            *.tar.bz2|*.tar.gz|*.tar|*.tgz|*.tbz2)
                # Count top-level entries for tar archives
                num_top_level_entries=$(tar -tf "$archive_file" | awk -F'/' '{print $1}' | sort -u | wc -l)
                ;;
            *.zip|*.jar|*.epub|*.cbz)
                # Count top-level entries for zip archives
                # Match only real file entries (those with a time in the row)
                num_top_level_entries=$(unzip -l "$archive_file" | grep -v '^__MACOSX/' | awk '/[0-9][0-9]:[0-9][0-9]/{print $NF}' | awk -F'/' '{print $1}' | sort -u | wc -l)
                ;;
            *.rar|*.cbr)
                # Count top-level entries for rar archives
                num_top_level_entries=$(unrar l "$archive_file" | grep -E '[d-]rw' | awk '{print $NF}' | awk -F'/' '{print $1}' | sort -u | wc -l)
                ;;
            *.7z|*.cb7)
                # Count top-level entries for 7z archives (match rows with an attribute column)
                num_top_level_entries=$(7z l "$archive_file" | grep -E '\.{4}[AD]' | awk '{print $NF}' | awk -F'/' '{print $1}' | sort -u | wc -l)
                ;;
            *.gz|*.bz2|*.Z)
                # Single file archives, always extract directly
                num_top_level_entries=1
                ;;
            *.dmg)
                # DMG is a mount, not extraction, so skip bomb detection
                echo "Mounting DMG: hdiutil mount "$archive_file""
                hdiutil mount "$archive_file" || { echo "Error mounting DMG."; return 1; }
                return 0
                ;;
            *)
                echo "'$archive_file' cannot be extracted via extract()"
                return 1
                ;;
        esac

        if [ "$num_top_level_entries" -gt 1 ]; then
            requires_extracted_dir=true
            output_dir="./${archive_name}-extracted"
            mkdir -p "$output_dir" || { echo "Error: Could not create directory $output_dir"; return 1; }
            echo "Extracting '$archive_file' to '$output_dir'..."
        else
            echo "Extracting '$archive_file' to current directory..."
            output_dir="." # Extract to current directory
        fi

        case "$archive_file" in
            *.tar.bz2)   tar xvjf "$archive_file" -C "$output_dir" || { echo "Error extracting tar.bz2 archive."; rmdir "$output_dir" 2>/dev/null; return 1; } ;;
            *.tar.gz)    tar xvzf "$archive_file" -C "$output_dir" || { echo "Error extracting tar.gz archive."; rmdir "$output_dir" 2>/dev/null; return 1; } ;;
            *.tar)       tar xvf "$archive_file" -C "$output_dir" || { echo "Error extracting tar archive."; rmdir "$output_dir" 2>/dev/null; return 1; } ;;
            *.tgz)       tar xvzf "$archive_file" -C "$output_dir" || { echo "Error extracting tgz archive."; rmdir "$output_dir" 2>/dev/null; return 1; } ;;
            *.tbz2)      tar xvjf "$archive_file" -C "$output_dir" || { echo "Error extracting tbz2 archive."; rmdir "$output_dir" 2>/dev/null; return 1; } ;;
            *.gz)        gunzip -c "$archive_file" > "$output_dir/${archive_basename%.gz}" || { echo "Error decompressing gz file."; return 1; } ;;
            *.bz2)       bunzip2 -c "$archive_file" > "$output_dir/${archive_basename%.bz2}" || { echo "Error decompressing bz2 file."; return 1; } ;;
            *.rar)       unrar x "$archive_file" "$output_dir" || { echo "Error extracting rar archive."; rmdir "$output_dir" 2>/dev/null; return 1; } ;;
            *.zip)       unzip "$archive_file" -d "$output_dir" || { echo "Error extracting zip archive."; rmdir "$output_dir" 2>/dev/null; return 1; } ;;
            *.Z)         uncompress -c "$archive_file" > "$output_dir/${archive_basename%.Z}" || { echo "Error decompressing Z file."; return 1; } ;;
            *.7z)        7z x "$archive_file" -o"$output_dir" || { echo "Error extracting 7z archive."; rmdir "$output_dir" 2>/dev/null; return 1; } ;;
            *.cbr)       unrar x "$archive_file" "$output_dir" || { echo "Error extracting cbr archive."; rmdir "$output_dir" 2>/dev/null; return 1; } ;;
            *.cbz)       unzip "$archive_file" -d "$output_dir" || { echo "Error extracting cbz archive."; rmdir "$output_dir" 2>/dev/null; return 1; } ;;
            *.cb7)       7z x "$archive_file" -o"$output_dir" || { echo "Error extracting cb7 archive."; rmdir "$output_dir" 2>/dev/null; return 1; } ;;
            *.jar)       unzip "$archive_file" -d "$output_dir" || { echo "Error extracting jar archive."; rmdir "$output_dir" 2>/dev/null; return 1; } ;;
            *.epub)      unzip "$archive_file" -d "$output_dir" || { echo "Error extracting epub archive."; rmdir "$output_dir" 2>/dev/null; return 1; } ;;
            *.dmg)       return 0 ;; # Already handled above
            *)           echo "'$archive_file' cannot be extracted via extract() (unsupported format)"; return 1 ;;
        esac

        if $requires_extracted_dir && [ -z "$(ls -A "$output_dir" 2>/dev/null)" ]; then
            echo "Warning: '$output_dir' is empty after extraction. Removing empty directory."
            rmdir "$output_dir"
        fi
    else
        echo "'$1' is not a valid file"
        return 1
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
