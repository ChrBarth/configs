#!/bin/bash
# simple script that adds some git infos
# to the bash prompt (see ~/.bashrc)

if [ -d "$(pwd)/.git" ]
then
    BRANCH=$(git branch | sed -ne 's/^\* \(.*\)/\1/p')
    BRANCH="\033[1;36m$BRANCH"
    CHANGES=$(git status -s | wc -l)
    STATUS="\033[1;32m☑"
    if [ $CHANGES -ne "0" ]
    then
        STATUS="\033[1;31m⚠"
    fi
    echo -e "[$BRANCH $STATUS\033[0m]"
fi
