export PS1="hoki : "

#List
alias ll='ls -GhlAso'

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

#Refresh the profile
alias hokirefresh='source ~/hoki_bash_profile/.bash_profile'
