# Changing Environments
#------------------------------------------------------------------------
function ostkChangeEnv(){
	sudo cp ~/ostkCustom/hosts/$1 /etc/hosts
	echo '-- OSTK - Environment Changed to '\"$1\"' --'
	sudo dscacheutil -flushcache
	echo 'Caches Flushed'
	sudo killall -HUP mDNSResponder
	echo 'DNS Flushed'
}
alias ostkdev='ostkChangeEnv ugc.dev'
alias ostktest='ostkChangeEnv ugc.test'
alias ostkprod='ostkChangeEnv prod'
alias ostkdogfood='ostkChangeEnv dogfood.test'


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