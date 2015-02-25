bplist00�_WebMainResource�	
^WebResourceURL_WebResourceData_WebResourceMIMEType_WebResourceTextEncodingName_WebResourceFrameName_Uhttps://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/themes/bira.zsh-themeO�<html><head><style>.pkt_added {text-decoration:none !important;}</style></head><body><pre style="word-wrap: break-word; white-space: pre-wrap;"># ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
local rvm_ruby=''
if which rvm-prompt &amp;&gt; /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &amp;&gt; /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─${user_host} ${current_dir} ${rvm_ruby} ${git_branch}
╰─%B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
</pre></body></html>Ztext/plainUUTF-8P    ( 7 I _ } � ����                           �