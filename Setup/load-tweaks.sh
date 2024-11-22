#!/bin/bash
# TODO: Replace the password delay in /etc/pam.d/system-auth with "nodelay"

# Library
. shared.sh

# Sudo auth
echo "First.. SUDO!"
sudo printf "Sudo successful!\n\n"

# Functions
function loadFile() {	
	if [[ ! -e "backup" ]]; then
		mkdir backup
	fi
	if [[ ! -e "backup/old" ]]; then
		mkdir backup/old
	fi
	
	targetPath="$1"
	sourcePath="./backup/$(formatBackupPath "$targetPath")"
	
	read -p "Do you want to install $sourcePath into $targetPath? [y/n]: " yn
	case $yn in
		[Yy]*)
			if [[ -e "$sourcePath" ]]; then
				echo "Installed"
				sudo cp -f "$targetPath" "./backup/old/$(formatBackupPath "$targetPath")"
				sudo cp -f "$sourcePath" "$targetPath"
			else
				echo "Couldn't find file at $sourcePath!"
			fi
			return 0
		;;
		[Nn]*)
			echo "Skipped"
			return 1
		;;
	esac
	printf "\n"
}

# Sudo password asterisks
visudo_append='Defaults env_reset,pwfeedback'
if [ -z "$(grep "$visudo_append" /etc/sudoers )" ]; then
  printf "\n# Making asterisks visible\n$visudo_append\n\n" | sudo EDITOR='tee -a' visudo
fi

# Disabling per-process 8 GB memory limit
# FIXME: Won't work and its process-level. Modify /etc/security/limits.conf instead
# ulimit -l unlimited

# Loading in misc files
loadFile /etc/pacman.conf
loadFile /etc/fstab

# TODO: Add installation of flatpaks
