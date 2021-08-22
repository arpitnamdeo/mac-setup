#-----------------------------
# Dircolors
#-----------------------------
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

## -----------------------------------
# Completion
## -----------------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## -----------------------------------
## Theme and prompt
## -----------------------------------
setprompt() {
  setopt prompt_subst

  if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
    p_host='%F{yellow}%M%f'
  else
    p_host='%F{green}%M%f'
  fi

  PS1=${(j::Q)${(Z:Cn:):-$'
    %F{cyan}[%f
    %(!.%F{red}%n%f.%F{green}%n%f)
    %F{cyan}@%f
    ${p_host}
    %F{cyan}][%f
    %F{blue}%~%f
    %F{cyan}]%f
    %(!.%F{red}%#%f.%F{green}%#%f)
    " "
  '}}

  PS2=$'%_>'
  RPROMPT=$'${vcs_info_msg_0_}'
}


### Prompt for Ubuntu profile
# This will set the default prompt to the Oliver theme
#prompt oliver

# Manually set prompt
PROMPT='%F{blue}%n%f@%F{blue}%m%f %B%F{yellow}%1~%f%B %# '
RPROMPT='[%F{yellow}%?%f] [%D{%H:%M:%S}]'

# Use prompt function defined above
#setprompt


## Cloud Native Developer Toolkit

# KUBE_PS1 start
KUBE_PS1_SYMBOL_ENABLE=true
KUBE_PS1_SYMBOL_USE_IMG=true
KUBE_PS1_NS_ENABLE=true

function get_cluster_short() {
  CLUSTER_NAME=$(echo $1 | awk -F / '{print $2}')
  SERVER=$(grep -A 1 -B 1 "${CLUSTER_NAME}" ~/.kube/config | grep server | sed -E "s/ *server: (.*)/\1/g")
  NEW_CLUSTER_NAMES=$(grep -A 1 -B 1 "${SERVER}" ~/.kube/config | grep name | grep -v ${CLUSTER_NAME} | sed -E "s/ *name: (.*)/\1/g")
  NEW_CLUSTER_NAME=${NEW_CLUSTER_NAMES%$'\n'*}
  if [[ -n "${NEW_CLUSTER_NAME}" ]]; then
    echo "${NEW_CLUSTER_NAME}"
  else
    echo ${CLUSTER_NAME}
  fi
}

KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short

source "${HOME}/bin/kube-ps1.sh"
PROMPT='$(kube_ps1) '$PROMPT
