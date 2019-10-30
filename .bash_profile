#========================================= Hoki Bash Profile =========================================#

source ~/hoki-bash-profile/aliases.sh
source ~/hoki-bash-profile/colors.sh
source ~/hoki-bash-profile/functions-git.sh
source ~/hoki-bash-profile/functions-hoki.sh
source ~/hoki-bash-profile/functions-hokiskateboards.sh
source ~/hoki-bash-profile/functions-work.sh
source ~/hoki-bash-profile/tlp.sh
source ~/hoki-bash-profile/profile-ps1.sh

# Brew
export PATH="/usr/local/sbin:$PATH"

# NVM
# Installed with Git
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
