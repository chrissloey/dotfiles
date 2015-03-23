# Ansible
export ANSIBLE_HOSTS=~/.ansible
[[ -d ~/.ansible/bin ]] && export PATH=~/.ansible/bin:$PATH


# NVM
export NVM_DIR="/Users/chris/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# z
. `brew --prefix`/etc/profile.d/z.sh
