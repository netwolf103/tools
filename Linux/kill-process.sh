#!/bin/bash
# -----------------------------------------------------------------------------------------------
# Filename: kill-process.sh
# Version: 0.0.1
# Date: 2020/03/06
# Author: Zhang Zhao <netewolf103@gmail.com>
# Description: Kill processes by name
# -----------------------------------------------------------------------------------------------

printTitle()
{
    echo -e "\033[31m$1\033[0m"
}

printNotice()
{
    echo -e "\033[33m$1\033[0m"
}

while read PROCESS
do
    if [ -z $PROCESS ]; then
        printNotice "Invalid command."
    else
       case $PROCESS in
            "Quit"|"Exit")
                printNotice "Bye"
                break 1
                ;;
            *)
	        printTitle "All '$PROCESS' processes are killing"
                ps -ef | grep $PROCESS | awk '{print $2}' | xargs kill
                ;;
        esac
    fi
done

exit $?