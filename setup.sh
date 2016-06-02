# OS X settings
./osx.sh

function require_brew() {
    echo "brew $1 $2"
    brew list $1 > /dev/null 2>&1 | true
    if [[ ${PIPESTATUS[0]} != 0 ]]; then
        echo "brew install $1 $2"
        brew install $1 $2
        if [[ $? != 0 ]]; then
            echo "failed to install $1! aborting..."
            exit -1
        fi
    fi
}

# Brew
brew update
brew upgrade
brew tap homebrew/dupes
brew tap homebrew/versions

require_brew rbenv
require_brew ruby-build
require_brew openssl
require_brew docker
require_brew python
require_brew zsh
require_brew git
require_brew hub
require_brew imagemagick
require_brew redis
require_brew nvm
require_brew the_silver_searcher
require_brew ansible
require_brew autoenv
require_brew z
require_brew elixir
require_brew watchman

brew tap neovim/homebrew-neovim
brew install --HEAD neovim

brew tap homebrew/homebrew-php
require_brew php55
require_brew homebrew/php/composer

brew tap thoughtbot/formulae
require_brew rcm

# Make things we just installed useable
export PATH=/usr/local/bin:$PATH

# Change login shell to zsh
echo "Setting zsh as user shell"
sudo dscl . -create $HOME UserShell /usr/local/bin/zsh
chsh -s /usr/local/bin/zsh

# Install dotfiles
echo "Installing dotfiles"
rcup -v

# Install ruby
echo "Installing ruby"
rbenv install 2.3.0
rbenv global 2.3.0
rbenv rehash


# Node
echo "Installing node"
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # load nvm
nvm install node
nvm alias default node

# NPM
npmlist=`npm list -g`
function require_npm() {
    echo "npm $1"
    echo $npmlist | grep $1@ > /dev/null
    if [[ $? != 0 ]]; then
        echo "npm install -g $1"
        npm install -g $1
    fi
}

require_npm bower
require_npm mocha
require_npm rnpm
require_npm react-native-cli

# Gems
function require_gem() {
    echo "gem $1"
    if [[ $(gem list --local | grep $1 | head -1 | cut -d' ' -f1) != $1 ]];
        then
            echo "gem install $1"
            gem install $1
    fi
}

require_gem bundler
require_gem rails
require_gem cocoapods
require_gem awesome_print
require_gem fastlane
rbenv rehash

# Docker ansible
pip install --upgrade pip
pip install docker-py

# Done
echo
echo "===================="
echo "All done."
echo "===================="
echo
echo "Some todos:"
echo "  - Update gitconfig with correct details if you're not me"
echo "  - Either install iterm shell integration, or remove it from ~/.zshrc"
echo "  - Install docker"
echo "  - Make sure nvm and rbenv installed stuff"
