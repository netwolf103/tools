#!/bin/bash
# -----------------------------------------------------------------------------------------------
# Filename: check-site-alive.sh
# Version: 0.0.1
# Date: 2019/12/19
# Author: Zhang Zhao <netewolf103@gmail.com>
# Description: Detect if a website is online.
# -----------------------------------------------------------------------------------------------

ALIVE_STATUS="200|301|204|302"

printDelimiter() {
    echo "----------------------------------"
}

for SITE in $*; do
    HTTP_STATUS=`curl -I "$SITE" 2>&1 | awk '/HTTP\// {print $2}'`
    
    case "$HTTP_STATUS" in
        200|301|204|302)
            echo "$SITE is alive"
        ;;

        *)
            echo "$SITE is offline, HTTP STATUS: $HTTP_STATUS"
        ;;
    esac

    printDelimiter
done

exit $?