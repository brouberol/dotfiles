# git
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}git(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function icon {
    if [ -n "$(ifconfig | grep wg0)" ]; then
        echo '🔒'
    else
        echo 'λ'
    fi
}

local ret_status="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})"
PROMPT='${ret_status}$(icon) %{$fg[yellow]%}%c%{$reset_color%}$(git_prompt_info) '

if [ -e /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh ]; then
    source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh

    function k8s_prompt_info {
        if [[ $(pwd) != *k8s* ]]; then
            return
        fi
        KUBE_CLUSTER=$(echo $ZSH_KUBECTL_PROMPT | cut -d. -f1)
        if [[ $ZSH_KUBECTL_PROMPT = *prod* ]]; then
            k8s_color=red
        else
            k8s_color=green
        fi
        KUBECTX="%{$fg_bold[$k8s_color]%}⎈ ($ZSH_KUBECTL_PROMPT)%{$reset_color%}"
        echo "$KUBECTX"
    }
    PROMPT+=' $(k8s_prompt_info)'
fi

PROMPT=$(echo $PROMPT | sed 's/\s+/\s/g')
