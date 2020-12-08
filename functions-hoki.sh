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

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
