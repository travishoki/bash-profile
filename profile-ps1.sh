#========================================= PS1 =========================================#

PS1="\[$COLOR_WHITE\]\n\$(hokipwd)"         	# PWD
PS1+="\[\$(git_color)\]"                    	# Colors git status
PS1+="\$(git_branch)"                      		# Current branch
PS1+="\[$COLOR_OCHRE\]$(ostkenvironment)"	# Ostk environment
PS1+=" \[$COLOR_BLUE\]\$\[$COLOR_RESET\] "   	# '#' for root, else '$'
export PS1
