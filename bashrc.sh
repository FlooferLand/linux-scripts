
# removes orphan configs (command is from https://www.youtube.com/watch?v=Ahp34-1PtBE)
function technoblade() {
	if [[ $1 == "more" ]]; then
		# Lists descriptions and other info aswell
		dpkg -l | awk '/^rc/'
	else
		dpkg -l | awk '/^rc/  {print($2)}'
	fi
}
