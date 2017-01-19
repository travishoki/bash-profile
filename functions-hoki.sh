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
  if [ ! -z "$shortpwd" ]; then
    echo '~'$shortpwd':'
  fi 
}

#Open Profile
function hokiprofile(){
  echo '-- Hoki Profile --'
  local TEMPURL='/Users/thoki/hoki-bash-profile'

  echo 'Got to dir'
  cd $TEMPURL
  echo 'Open in sublime'
  subl .
  echo 'Open in Tower'
  gittower .
}

#Open work applications
function hokiwork(){
  echo '-- Hoki Work --'

  cd /
  cd Applications

  TEMPAPPARRAY=("Slack" "Spotify" "Tower" "Google Chrome" "Sublime Text" "iTerm")
  for i in "${TEMPAPPARRAY[@]}"; do
    if pgrep -xq -- "${i}"; then
        echo 'Already Running '"$i"
    else
        echo 'Open '"$i"
        open -a "$i"
    fi
  done

  ostkChangNPMRC true

  echo '----------------------'

  echo 'Go to "os" Dir'
  cd ~/os
  l
}

#Switch npm for home projects
function hokihome(){
  echo '-- Hoki Home --'

  ostkChangNPMRC false
}
