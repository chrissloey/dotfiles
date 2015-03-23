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
rbenv install 2.2.0
rbenv global 2.2.0
rbenv rehash

require_brew openssl
require_brew docker
require_brew python
require_brew fig
require_brew zsh
require_brew git
require_brew hub
require_brew imagemagick
require_brew redis
require_brew node
require_brew the_silver_searcher
require_brew ansible
require_brew postgres
require_brew carthage

brew tap neovim/homebrew-neovim
brew install --HEAD neovim

brew tap homebrew/homebrew-php
require_brew php55
require_brew homebrew/php/composer

brew tap thoughtbot/formulae
require_brew rcm

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
require_npm grunt

# Gems
function require_gem() {
    echo "gem $1"
    if [[ $(gem list --local | grep $1 | head -1 | cut -d' ' -f1) != $1 ]];
        then
            echo "gem install $1"
            gem install $1
    fi
}

require_gem cocoapods
require_gem git-up
rbenv rehash

# Docker ansible
pip install docker-py
