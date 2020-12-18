#Open Profile
function hokiprofile(){
	echo '-- Hoki Profile --'

	hokititle "Bash Profile"

	echo 'Got to dir'
	cd ~/hoki-bash-profile

	echo 'Open in Atom'
	atom .

	echo 'Open in Finder'
	open .

	echo 'Open in Tower'
	gittower .
}
