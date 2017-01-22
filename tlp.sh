#========================================= TLP Functions =========================================#

#Open Websites
function tlpweb(){
  TEMPAPPARRAY=(
  	"https://mail.google.com/mail/u/0/#inbox"
  	"https://drive.google.com/drive/u/0/my-drive"
  	"https://calendar.google.com/calendar/render?tab=oc"
  	"https://www.17hats.com/"
  	)
  for i in "${TEMPAPPARRAY[@]}"; do
  	echo "Open "$i
	open -a "Google Chrome" "$i"
  done	
}

#Open Applications
function tlpapps(){
  TEMPAPPARRAY=("Google Chrome" "Adobe Lightroom" "iTerm")
  hokiOpenApps TEMPAPPARRAY[@]
}

