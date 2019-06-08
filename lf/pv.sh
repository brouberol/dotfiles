#!/bin/bash

if [ $# -eq 1 ]; then
    # executed when i is hit
    bat --style=full --pager='less -RF' $1
else
    cat $1
fi
