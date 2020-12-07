#Open Profile
function hokiprofile(){
	echo '-- Hoki Profile --'

	echo 'Got to dir'
	cd ~/hoki-bash-profile

	hokititle "Bash Profile"

	echo 'Open in Atom'
	atom .

	echo 'Open in Tower'
	gittower .
}
