#Open Hoki Skateboards applications
function hokiskateboards(){
	echo '-- Hoki Skateboards --'

	hokititle "Hoki Skateboards"

	#Open Applications
	TEMPAPPARRAY1=("Google Chrome")
	_hokiOpenApps TEMPAPPARRAY1[@]

	echo 'Got to dir'
	cd ~/Sites/wp/themes/hokiskateboards-wp

	echo 'Open in Atom'
	atom .

	echo 'Open in Finder'
	open .

	echo 'Open in Tower'
	gittower .
}
