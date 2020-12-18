#Open Portfolio
function hokiportfolio(){
	echo '-- Hoki Portfolio --'

	hokititle "Portfolio"

	echo 'Got to dir'
	cd ~//Sites/travishoki-react

	echo 'Open in Atom'
	atom .

	echo 'Open in Tower'
	gittower .

	echo 'Open in Finder'
	open .

	yarn start
}
