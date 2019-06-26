#Open work applications
function hokiwork(){
  echo '-- Hoki Work --'

  #Open Applications
  TEMPAPPARRAY1=("Slack" "Spotify" "Google Chrome" "iTerm")
  _hokiOpenApps TEMPAPPARRAY1[@]

  #Close Applications
  # TEMPAPPARRAY2=()
  # _hokiCloseApps TEMPAPPARRAY2[@]

  hokititle "Chatbooks"

  echo '----------------------'

  # Go to Chatbooks
  cd ~/Sites/web-infinite/

  # Open Tower
  gittower .

  # Open Atom
  atom .
}
