#!/bin/sh
# -----------------------------------------------------------------------------------------------
# Filename: img2webp.sh
# Version: 0.0.1
# Date: 2019/11/30 2:05:10
# Author: Zhang Zhao
# Description: Monitor newly added png and jpg images in a directory and convert to webp format.
# -----------------------------------------------------------------------------------------------

IMG_DIR=/var/www/html/media

/usr/bin/inotifywait -mrq -e create,modify,attrib $IMG_DIR | while read path action file;
do
    OLDFILE="$path$file"
    NEWFILE="$OLDFILE.webp"

    if [[ $(file -b $OLDFILE) =~ ^('PNG '|'JPEG ') ]]; then
        cwebp $OLDFILE -o $NEWFILE
        chown apache:apache $NEWFILE
    elif [[ $(file -b $OLDFILE) =~ ^('GIF ') ]]; then
        gif2webp $OLDFILE -o $NEWFILE
        chown apache:apache $NEWFILE
    fi
done

exit $?