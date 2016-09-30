export PATH=/usr/local/bin:$PATH

# Ansible
export ANSIBLE_HOSTS=~/.ansible
[[ -d ~/.ansible/bin ]] && export PATH=~/.ansible/bin:$PATH

# z
. `brew --prefix`/etc/profile.d/z.sh

# Android
export ANDROID_HOME=~/Library/Android/sdk
. $HOME/.asdf/asdf.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
source /usr/local/opt/autoenv/activate.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
