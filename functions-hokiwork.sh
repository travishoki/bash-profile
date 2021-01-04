#Open work applications
function hokiwork(){
	echo '-- Hoki Work --'

	hokititle "XANT"

	#Open Applications
	TEMPAPPARRAY1=(
		"Atom"
		"Microsoft Outlook"
		"Microsoft Teams"
		"Spotify"
		"Google Chrome"
	)
	_hokiOpenApps TEMPAPPARRAY1[@]

	echo 'Got to dir'
	cd ~/Sites/xant/

	echo 'Open in Tower'
	gittower .

	echo 'Open in Finder'
	open .
}
