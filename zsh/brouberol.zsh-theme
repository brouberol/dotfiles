# git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}g(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) "

local ret_status="%(?:%{$fg_bold[green]%}λ:%{$fg_bold[red]%}λ)"
PROMPT='${ret_status} %{$fg[yellow]%}%c%{$reset_color%} $(git_prompt_info)'
