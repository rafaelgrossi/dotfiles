PROMPT='%{$fg[cyan]%}% @ %d%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%

%{$fg[magenta]%}$%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
