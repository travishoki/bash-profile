# Changing Environments
#------------------------------------------------------------------------
export JAVA_HOME=$(/usr/libexec/java_home)
export DESKTOP_DB_HOSTNAME=seo.desktopdb.dev.ostk.com
export DESKTOP_DB_DATABASE_NAME=jtew
export DESKTOP_DB_DATABASE_NAME_SHP=jtew
export DESKTOP_DB_ENABLED=true

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
alias ostkugcdev='ostkChangeEnv ugc.dev'
alias ostkugctest='ostkChangeEnv ugc.test'
alias ostkintegration='ostkChangeEnv integration.test'
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

alias hokiheroku='openProject Sites/Heroku'

function hokiportfolio(){
	openProject 'Sites/travishoki/travishoki-react'
	npm run start -s
}

function hokips(){
	echo '-- Open Pluralsight Tutorial --'
	local TEMPDIR='/Users/thoki/Sites/plural-sight/react-and-redux/app'
	cd $TEMPDIR
	atom .
	open ../videos/
}

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

# Update Integration's Host File
#------------------------------------------------------------------------
alias host_update='sudo sed -i "" "/shopping/s/[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*/$(host shopping-integration.test.overstock.com  | grep -Eo "[0-9]+.[0-9]+.[0-9]+.[0-9]+")/g" ~/Library/Gas\ Mask/Local/integration.test.hst;sudo sed -i "" "/akamai/s/[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*/$(host www-proxy-integration.test.overstock.com  | grep -Eo "[0-9]+.[0-9]+.[0-9]+.[0-9]+")/g" ~/Library/Gas\ Mask/Local/Integration.test.hst'
