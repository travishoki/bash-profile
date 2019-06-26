#========================================= Hoki Bash Profile =========================================#

source ~/hoki-bash-profile/aliases.sh
source ~/hoki-bash-profile/colors.sh
source ~/hoki-bash-profile/functions-git.sh
source ~/hoki-bash-profile/functions-hoki.sh
source ~/hoki-bash-profile/functions-work.sh
source ~/hoki-bash-profile/tlp.sh
source ~/hoki-bash-profile/profile-ps1.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
