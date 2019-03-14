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
  unwanted="cb/web-infinite"
  shortpwd=${shortpwd/$unwanted/$replacement}

  if [ ! -z "$shortpwd" ]; then
      echo '~'$shortpwd': '
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

function skatehokigame(){
    cd ~/Documents/skate-hoki/skate-hoki-corona
    echo 'Open in Atom'
    atom .
    echo 'Open in Tower'
    gittower .
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

#Open work applications
function hokiwork(){
  echo '-- Hoki Work --'

  #Open Applications
  TEMPAPPARRAY1=("Slack" "Spotify" "Tower" "Google Chrome" "Atom" "iTerm")
  _hokiOpenApps TEMPAPPARRAY1[@]

  #Close Applications
  TEMPAPPARRAY2=()
  _hokiCloseApps TEMPAPPARRAY2[@]

  echo '----------------------'

  echo 'Go to "Chatbooks" Dir'
  cd ~/cb/web-infinite/
  l
}
