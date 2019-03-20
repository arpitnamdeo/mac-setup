## -----------------------------------
## Theme and prompt
## -----------------------------------

### Zsh builtin themes for prompt 
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Prompt-Themes
# This will set the default prompt to the Oliver theme that comes with Zsh
#autoload -U promptinit
#promptinit
#prompt oliver

### Manually set prompt
PROMPT='%F{blue}%n%f@%F{blue}%m%f %B%F{yellow}%1~%f%B %# '
RPROMPT='[%F{yellow}%?%f] [%D{%H:%M:%S}]'
