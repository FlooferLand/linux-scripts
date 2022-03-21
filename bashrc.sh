
# Cleans up some unnecessary stuff
function clean() {
	# Remove orphan packages
	sudo pacman -Rns $(pacman -Qtdq)
	
	# Remove home cache
	rm -rf ~/.cache/*
	
	# Sync the file system
	sync
	
	echo Cleanup finished!
}


