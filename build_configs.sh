#!/bin/bash

# creates ~/.bashrc and ~/.config/ranger/rc.conf
# from ~/.config/folder_shortcuts.txt, ~/.config/bashrc_base and ~/.config/ranger_base.conf
SHORTCUTSFILE="${HOME}/.config/folder_shortcuts.txt"
BASHRC_BASE="${HOME}/.config/bashrc_base"
RANGER_BASE="${HOME}/.config/ranger_base.conf"

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

echo -e "\n# folder mappings:" > ranger_mappings.tmp
echo -e "\n# folder aliases:" > bash_aliases.tmp

# parse SHORTCUTSFILE and create temporary config files:
# using <(cat... so we can use single-quotes in aliases for .bashrc:
cat $SHORTCUTSFILE | \
awk -f <(cat - <<-'_EOT_'
BEGIN{FS="\t"}
/^[^#]/ { 
    printf("map g%s cd %s\n", $1, $2) >> "ranger_mappings.tmp" ;
    gsub(" ","\\ ",$2);
    printf("alias %s='cd %s'\n",$1,$2) >> "bash_aliases.tmp" }
_EOT_
)

# check exit status of previous command
if [ $? != 0 ]
then
    echo "Error parsing $SHORTCUTSFILE - aborting!"
    exit 1
fi

# create ~/.bashrc
cat $BASHRC_BASE bash_aliases.tmp > ${HOME}/.bashrc
echo "" >> ${HOME}/.bashrc
# create /.config/ranger/rc.conf
cat $RANGER_BASE ranger_mappings.tmp > ${HOME}/.config/ranger/rc.conf

rm ranger_mappings.tmp
rm bash_aliases.tmp
