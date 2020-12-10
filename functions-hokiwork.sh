#Open work applications
function hokiwork(){
	echo '-- Hoki Work --'

	#Open Applications
	TEMPAPPARRAY1=(
		"Atom"
		"Microsoft Outlook"
		"Microsoft Teams"
		"Spotify"
		"Google Chrome"
	)
	_hokiOpenApps TEMPAPPARRAY1[@]

	#Close Applications
	# TEMPAPPARRAY2=()
	# _hokiCloseApps TEMPAPPARRAY2[@]

	hokititle "XANT"

	echo '----------------------'

	# Go to Chatbooks
	cd ~/Sites/xant/
}

function title {
	echo -ne "\033]0;"$*"\007"
}

# Titles
alias tDevApi='title "ch-devapi"'
alias tStart='title "ch-atbooks"'
alias tStyleGuide='title "ch-style"'
