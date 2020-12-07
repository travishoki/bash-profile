#Open Game
function hokigame() {
	echo '-- Hoki Game --'

	#Open Applications
	TEMPAPPARRAY1=("Google Chrome")
	_hokiOpenApps TEMPAPPARRAY1[@]

	hokititle "Game"

	# Go to Chatbooks
	echo 'Got to dir'
	cd ~/Sites/hoki-skateboards-react-native/

	echo 'Open in Atom'
	atom .

	echo 'Open in Tower'
	gittower .

	echo 'Open in Finder'
	atom .

	nvm use

	yarn web
}
