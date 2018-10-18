source ~/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  # Ruby/Rails stuff
  bundler
  gem
  rbenv
  # Ember
  https://gist.github.com/WMeldon/19e822d30a57f48c36cd
  # Docker
  docker
  # Zsh
  zsh-users/zsh-completions src
  zsh-users/zsh-syntax-highlighting
  history-substring-search
  # Git stuff
  git-extras
  # Prettiness
  nojhan/liquidprompt
EOBUNDLES

antigen apply

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

source /Users/$USER/.iterm2_shell_integration.zsh

eval "$(rbenv init -)"

export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash


# Virtualenv
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export EDITOR=code

# ripgrep
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
