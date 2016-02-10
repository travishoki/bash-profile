#========================================= PS1 =========================================#

PS1="\[$COLOR_WHITE\]\n\$(hokipwd)"         # pwd
PS1+="\[\$(git_color)\]"                    # colors git status
PS1+=" \$(git_branch)"                      # current branch
PS1+="\[$COLOR_BLUE\]\$\[$COLOR_RESET\] "   # '#' for root, else '$'
export PS1
