export PATH=/usr/local/bin:$PATH

# Ansible
export ANSIBLE_HOSTS=~/.ansible
[[ -d ~/.ansible/bin ]] && export PATH=~/.ansible/bin:$PATH

# z
. `brew --prefix`/etc/profile.d/z.sh

# Android
export ANDROID_HOME=~/Library/Android/sdk
export PATH="$ANDROID_HOME/platform-tools:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
source /usr/local/opt/autoenv/activate.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"

# go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Elixir Ecto - used for migration gen
export ECTO_EDITOR=code
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
