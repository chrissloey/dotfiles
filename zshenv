export PATH=/usr/local/bin:$PATH

# Ansible
export ANSIBLE_HOSTS=~/.ansible
[[ -d ~/.ansible/bin ]] && export PATH=~/.ansible/bin:$PATH

# z
. `brew --prefix`/etc/profile.d/z.sh

# Android
export ANDROID_HOME=~/Library/Android/sdk
