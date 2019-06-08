#!/bin/bash

if [ $# -eq 1 ]; then
    # executed when i is hit
    bat --style=full --pager='less -RF' $1
elif [ -n $(wich pistol) ]; then
    pistol $1
else
    cat $1
fi
