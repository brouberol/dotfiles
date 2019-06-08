#!/bin/bash

filepath=$1

if [ $# -eq 1 ]; then
    # executed when i is hit
    bat --style=full --pager='less -RF' $filepath
else
    filename=$(basename -- "$filepath")
    extension="${filename##*.}"
    if [ -n "$extension" ]; then
        opts="-l $extension"
	else
        opts=""
    fi
     bat --paging=never --color=always --wrap=auto -p $opts $filepath
fi
