#========================================= Colors =========================================#

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

#========================================= Git Functions =========================================#

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}


#========================================= Custom Functions =========================================#

#Start a web server and open it in Google Chrome
function hokiws(){
  # Start a local web server
  # $1: (optional) port number
  # Default port 8000
  if [ -z "$1" ]; then
    port=8000;
  else
    port=$1;
  fi
  open -a "Google Chrome" "http://localhost:"$port
  php -S 127.0.0.1:$port
}

#Open file or URL in Google Chrome
function hokibrowse(){
  open -a "Google Chrome" $1
}


#========================================= PS1 =========================================#

PS1="\[$COLOR_WHITE\]\n[\$PWD]"             # pwd
PS1+="\[\$(git_color)\]"                    # colors git status
PS1+="\$(git_branch)"                       # current branch
PS1+="\[$COLOR_BLUE\]\$\[$COLOR_RESET\] "   # '#' for root, else '$'
export PS1

#========================================= Alias =========================================#

#---------- List ----------#
# l: display long format information (owner, group, size, time filename, links, etc.) 
# G: inhibit display of group information
# h: print sizes in human readable format (e.g., 1K 234M 2G) 
# A: list all entries, including names beginning with a period (.), he current directory (".") and parent directory ("..") are not listed
# s: indicate file size in blocks 
# g: do not list owner
# o: do not display owner
alias ll='ls -lGhAsgo'

#Refresh the profile
alias hokirefresh='source ~/.bash_profile'





