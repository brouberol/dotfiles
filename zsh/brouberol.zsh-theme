autoload -U colors; colors
source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh

# git
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# k8s
function k8s_prompt_info {
    if [[ $(pwd) != *k8s* ]]; then
        return
    fi
    KUBE_CLUSTER=$(echo $ZSH_KUBECTL_PROMPT | cut -d. -f1)
    KUBECTX="%{$fg_bold[blue]%}⎈ ($KUBE_CLOUD/$ZSH_KUBECTL_PROMPT)%{$reset_color%}"
    echo " $KUBECTX"
}

local ret_status="%(?:%{$fg_bold[green]%}λ :%{$fg_bold[red]%}λ )"

PROMPT='${ret_status} %{$fg[yellow]%}%c%{$reset_color%}$(git_prompt_info)$(k8s_prompt_info) '
