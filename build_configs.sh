#!/bin/bash

# creates ~/.bashrc and ~/.config/ranger/rc.conf
# from ~/.config/folder_shortcuts.txt, ~/.config/bashrc_base and ~/.config/ranger_base.conf
SHORTCUTSFILE="${HOME}/.config/folder_shortcuts.txt"
BASHRC_BASE="${HOME}/.config/bashrc_base"
RANGER_BASE="${HOME}/.config/ranger_base.conf"
TMP_BASHRC="${HOME}/bash_aliases.tmp"
TMP_RANGERMAPPINGS="${HOME}/ranger_mappings.tmp"

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

echo -e "\n# folder mappings:" > $TMP_RANGERMAPPINGS
echo -e "\n# folder aliases:" > $TMP_BASHRC

# parse SHORTCUTSFILE and create temporary config files:
cat $SHORTCUTSFILE | awk 'BEGIN {FS="\t"} /^[^#]/ { printf("alias %s=\"cd %s\"\n",$1,$2) >> "bash_aliases.tmp" ; printf("map g%s %s\n", $1, $2) >> "ranger_mappings.tmp" }'

# check exit status of previous command
if [ $? != 0 ]
then
    echo "Error parsing $SHORTCUTSFILE - aborting!"
    exit 1
fi

# create ~/.bashrc
cat $BASHRC_BASE $TMP_BASHRC > ${HOME}/.bashrc
# create /.config/ranger/rc.conf
cat $RANGER_BASE $TMP_RANGERMAPPINGS > ${HOME}/.config/ranger/rc.conf

rm $TMP_BASHRC
rm $TMP_RANGERMAPPINGS
