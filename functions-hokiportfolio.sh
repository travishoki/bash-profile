#Open Portfolio
function hokiportfolio(){
	echo '-- Hoki Portfolio --'

	echo 'Got to dir'
	cd ~//Sites/travishoki-react

	hokititle "Portfolio"

	echo 'Open in Atom'
	atom .

	echo 'Open in Tower'
	gittower .

	echo 'Open in Finder'
	atom .

	yarn start
}
