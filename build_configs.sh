#!/bin/bash

# creates ~/.bashrc and ~/.config/ranger/rc.conf
# from ~/.config/folder_shortcuts.txt, ~/.config/bashrc_base and ~/.config/ranger_base.conf
SHORTCUTSFILE="${HOME}/.config/folder_shortcuts.txt"
BASHRC_BASE="${HOME}/.config/bashrc_base"
RANGER_BASE="${HOME}/.config/ranger_base.conf"
TMP_RANGER="${HOME}/ranger_temp"
TMP_BASH="${HOME}/bash_temp"

# first, check if source files exist:
if [ ! -f $SHORTCUTSFILE ]
then
    echo "$SHORTCUTSFILE not found!"
    exit 1
elif [ ! -f $BASHRC_BASE ]
then
    echo "$BASHRC_BASE not found!"
    exit 1
elif [ ! -f $RANGER_BASE ]
then
    echo "$RANGER_BASE not found!"
    exit 1
fi

echo -e "\n# folder mappings:" > $TMP_RANGER
echo -e "\n# folder aliases:" > $TMP_BASH

# parse SHORTCUTSFILE and create temporary config files:
# using <(cat... so we can use single-quotes in aliases for .bashrc:
cat $SHORTCUTSFILE | \
awk -v RANGER=$TMP_RANGER -v BASH=$TMP_BASH -f <(cat - <<-'_EOT_'
BEGIN{FS="\t"}
/^[^#]/ { 
    printf("map g%s cd %s\n", $1, $2) >> RANGER ;
    gsub(" ","\\ ",$2);
    printf("alias %s='cd %s'\n",$1,$2) >> BASH }
_EOT_
)

# check exit status of previous command
if [ $? != 0 ]
then
    echo "Error parsing $SHORTCUTSFILE - aborting!"
    exit 1
fi

# create ~/.bashrc
cat $BASHRC_BASE $TMP_BASH > ${HOME}/.bashrc
echo "" >> ${HOME}/.bashrc
# create /.config/ranger/rc.conf
cat $RANGER_BASE $TMP_RANGER > ${HOME}/.config/ranger/rc.conf

rm $TMP_RANGER
rm $TMP_BASH
