#Open work applications
function hokiwork(){
  echo '-- Hoki Work --'

  #Open Applications
  TEMPAPPARRAY1=("Slack" "Spotify" "Google Chrome")
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

  # Open Visual Studio Code
  code .
}

alias tDevApi='title "ch-devapi"'
alias tStart='title "ch-atbooks"'
alias tStyleGuide='title "ch-style"'

alias chat='tStart && yarn clear:env && sudo yarn start'
alias chdevapi='tDevApi && cdweb && sudo yarn start:dev-api'
