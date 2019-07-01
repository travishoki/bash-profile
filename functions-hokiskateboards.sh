#Open Hoki Skateboards applications
function hokiskateboards(){
  echo '-- Hoki Skateboards --'

  #Open Applications
  TEMPAPPARRAY1=("Google Chrome")
  _hokiOpenApps TEMPAPPARRAY1[@]

  #Close Applications
  # TEMPAPPARRAY2=()
  # _hokiCloseApps TEMPAPPARRAY2[@]

  hokititle "Chatbooks"

  echo '----------------------'

  # Go to Chatbooks
  cd ~/Sites/wp/themes/hokiskateboards-wp

  # Open Tower
  gittower .

  # Open Atom
  atom .
}
