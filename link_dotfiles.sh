#!/bin/bash
# **************************
#
# copy dotfiles from home directory into a backup location; remove old dotfiles, and then create links into he dotfile repo
#
# **************************

# get the location of the new dotfiles we're putting in place
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# TODO: this still misses files that are named ..blah; we can do something with the ..?* expression
DIR2=$DIR"/\.[^\.]*"

# create location to backup old dotfiles 
backup_identifier=$(hostname)_$(date +%s)
backup_storage_location=$DIR/$backup_identifier
mkdir -v "$backup_storage_location"

# for every dotfile in the dotfiles directory, move the original dotfile from the home directory to the backup directory & then link the dotfile into place
for dotfile in $DIR2
    do
        dotfile_name=$(basename "$dotfile")
        echo -n "Moving:  "
        mv -v ~/"$dotfile_name" "$backup_storage_location"
        echo -n "Linking: "
        ln -vs "$dotfile" ~/"$dotfile_name"
    done
