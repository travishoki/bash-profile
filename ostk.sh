# Changing Environments
#------------------------------------------------------------------------
function ostkChangeEnv(){
	sudo cp ~/ostkCustom/hosts/$1 /etc/hosts
	echo '-- OSTK - Environment Changed to '\"$1\"' --'
	sudo dscacheutil -flushcache
	echo 'Caches Flushed'
	sudo killall -HUP mDNSResponder
	echo 'DNS Flushed'
	hokirefresh
}
alias ostkdev='ostkChangeEnv latte.dev'
alias ostktest='ostkChangeEnv latte.test'
alias ostkugcdev='ostkChangeEnv ugc.dev'
alias ostkugctest='ostkChangeEnv ugc.test'
alias ostkprod='ostkChangeEnv prod'

function hokicode(){
	echo '-- Open Git --'
	if [ -d ".git" ];then
		echo 'Open in Atom'
		atom .
		echo 'Open in Tower'
		gittower .
	fi
}

# Print Environment
#------------------------------------------------------------------------
function ostkenvironment(){
	local hostEnv=`cat /etc/hosts | ggrep -Po '(?<=env:).+'`
	if [[ ${#hostEnv} > 0 ]];then
			echo '('$hostEnv')'
	fi
}

# Open Projects
#------------------------------------------------------------------------
function openProject(){
	echo '-- Open '$1' --'
	echo 'Go to dir'
	local TEMPDIR='/Users/thoki/'
	cd $TEMPDIR''$1
	hokicode
}
alias sarp='openProject os/ugc/sarp'
alias myreviews='openProject os/ugc/reviews'
alias productpage='openProject os/product-page'
alias staticPage='openProject os/static-responsive-base'

alias hokiporfolio='openProject Sites/travishoki'
alias hokiheroku='openProject Sites/Heroku'
alias hokips='openProject Sites/plural-sight/react-and-redux/app'


# Change NPMRC
#------------------------------------------------------------------------
function ostkChangNPMRC(){
	echo 'CHANGE NPM RC'

	if $1; then
		echo 'Setup for Overstock'
		sudo cp ~/ostkCustom/npm/.npmrc ~/.npmrc
	else
		echo 'Setup for Home'
		sudo rm ~/.npmrc
	fi
}


# Get Current Product Page Versions
#------------------------------------------------------------------------
alias current="curr"

curr() {
    # For this to work, it is necessary to set Gas Mask preference "override external modifications" to "unchecked". This can be found under the "General" tab, in Gas Mask preferences.
    orig=`cat /etc/hosts`
    echo "##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1    localhost
255.255.255.255    broadcasthost
::1             localhost
" > /etc/hosts
    if [[ $1 = 'js' ]]; then
        curl https://www.overstock.com/Home-Garden/Stainless-Steel-Stock-Pots-Set-of-4/1/product.html | grep --color=always -o -n product-page.*.js | awk '{print "\n",$0,"\n"}'
    elif [[ $1 = 'css' ]]; then
        curl https://www.overstock.com/Home-Garden/Stainless-Steel-Stock-Pots-Set-of-4/1/product.html | grep --color=always -o -n product-page.*.css | awk '{print "\n",$0,"\n"}'
    else
        curl https://www.overstock.com/Home-Garden/Stainless-Steel-Stock-Pots-Set-of-4/1/product.html | grep --color=always -o -n "\(product-page.*.js\|product-page.*.css\)" | awk '{print "\n",$0}'
        echo "
"
    fi
    echo "$orig" > /etc/hosts
}
export NVM_DIR="/Users/thoki/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
