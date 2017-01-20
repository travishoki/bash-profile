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
alias ostkdev='ostkChangeEnv ugc.dev'
alias ostktest='ostkChangeEnv ugc.test'
alias ostkprod='ostkChangeEnv prod'
alias ostkdogfood='ostkChangeEnv dogfood.test'

# Print Environment
#------------------------------------------------------------------------
alias ostkenvironment='head -n 1 /etc/hosts'

# Open Projects
#------------------------------------------------------------------------
function ostkOpenProject(){
	echo '-- Open '$1' --'
	echo 'Go to dir'
	local TEMPDIR='/Users/thoki/os/'
	cd $TEMPDIR''$1
	echo 'Open in sublime'
	subl .
	echo 'Open in Tower'
	gittower .
}
alias sarp='ostkOpenProject ugc/sarp'
alias myreviews='ostkOpenProject ugc/reviews'
alias productpage='ostkOpenProject product-page/product-page'


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
