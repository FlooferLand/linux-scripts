
# removes orphan configs (command is from https://www.youtube.com/watch?v=Ahp34-1PtBE)
alias technoblade="dpkg -l | awk '/^rc/  {print($2)}'"
