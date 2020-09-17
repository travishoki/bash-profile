#========================================= Hoki Functions =========================================#

#Start a web server and open it in Google Chrome
function hokiws(){
	# Start a local web server
	# $1: (optional) port number
	# Default port 8000
	if [ -z "$1" ]; then
		port=8000;
	else
		port=$1;
	fi
	open -a "Google Chrome" "http://localhost:"$port
	php -S 127.0.0.1:$port
}

#Open file or URL in Google Chrome
function hokibrowse(){
	open -a "Google Chrome" $1
}

#Create pwd that does not include the /user/[USERNAME]/
function hokipwd(){
	shortpwd=${PWD##*/$USER}

	replacement="Chatbooks"
	unwanted="/Sites/web-infinite"
	shortpwd=${shortpwd/$unwanted/$replacement}

	if [ ! -z "$shortpwd" ]; then
		echo '~'$shortpwd': '
	fi
}

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

#Open Portfolio
function hokiportfolio(){
	echo '-- Hoki Portfolio --'

	echo 'Got to dir'
	cd ~//Sites/travishoki-react

	hokititle "Portfolio"

	echo 'Open in Atom'
	atom .

	echo 'Open in Tower'
	gittower .

	yarn start
}

function _hokiOpenApps(){
	echo '-- Hoki Open Apps --'

	echo 'Go to Applications'
	cd /
	cd Applications

	param1=("${!1}")
	for i in "${param1[@]}"; do
		if pgrep -xq -- "${i}"; then
			echo 'Already Running '"$i"
		else
			echo 'Open '"$i"
			open -a "$i"
		fi
	done
}

function _hokiCloseApps(){
	echo '-- Hoki Close Apps --'
	param1=("${!1}")
	for i in "${param1[@]}"; do
		if pgrep -xq -- "${i}"; then
			echo 'Close '"$i"
			osascript -e 'quit app "'$i'"'
		else
			echo 'Already Closed '"$i"
		fi
	done
}

#Atom title
function hokititle() {
	echo -n -e "\033]0;$1\007"
}

function hokigame() {
	echo '-- Hoki Game --'

	#Open Applications
	TEMPAPPARRAY1=("Google Chrome")
	_hokiOpenApps TEMPAPPARRAY1[@]

	hokititle "Game"

	# Go to Chatbooks
	echo 'Got to dir'
	cd ~/Sites/hoki-skateboards-react-native/

	echo 'Open in Tower'
	gittower .

	# Open Atom
	atom .

	nvm use

	yarn web
}

export NVM_DIR="$HOME/.nvm"
	[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"# This loads nvm
	[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"# This loads nvm bash_completion
