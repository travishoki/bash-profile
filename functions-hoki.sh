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

  echo 'Got to dir'
  cd
  cd 'hoki-bash-profile'
  echo 'Open in Atom'
  atom .
  echo 'Open in Tower'
  gittower .
}

function hokiOpenApps(){
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

function hokiCloseApps(){
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

#Open work applications
function hokiwork(){
  echo '-- Hoki Work --'

  #Open Applications
  TEMPAPPARRAY1=("Slack" "Spotify" "Tower" "Google Chrome" "Atom" "iTerm")
  hokiOpenApps TEMPAPPARRAY1[@]

  #Close Applications
  TEMPAPPARRAY2=("Spotify" "Junos Pulse" "Adobe Photoshop CC 2017")
  hokiCloseApps TEMPAPPARRAY2[@]

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
