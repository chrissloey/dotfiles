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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
source /usr/local/opt/autoenv/activate.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"
