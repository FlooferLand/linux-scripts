#!/bin/bash

# Library
. shared.sh

# TODO: Add in saving and loading of all the installed programs

function saveFile() {
	cat "$1" > "$HOME/Scripts/Setup/backup/$(formatBackupPath $1)"
}

saveFile /etc/pacman.conf
saveFile /etc/fstab
