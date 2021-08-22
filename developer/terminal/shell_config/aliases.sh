## -----------------------------------
# Aliases
## -----------------------------------
alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias o="open ." # Open the current directory in Finder

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'

alias  l="ls -G" # Display coloured file names using your chosen colour scheme
alias ll="ls -G -h -F -l" # List all files in current directory in long list format
alias la="ls -G -h -F -la" # List all files (including hidden) in current directory in long list format
alias ld="ls -G -h -F -d -la" # List all files in current directory in long list format

if hash gls 2>/dev/null; then
  alias  gl='gls --color=auto' # Display coloured file names using your chosen colour scheme
  alias gll='gls --color=auto --human-readable --classify --group-directories-first -l' # List all files in current directory in long list format
  alias gla='gls --color=auto --human-readable --classify --group-directories-first -la' # List all files (including hidden) in current directory in long list format
  alias gld='gls --color=auto --human-readable --classify --group-directories-first --directory -la' # List all files in current directory in long list format
fi

alias gwc='./gradlew clean'
alias gwb='./gradlew build'
alias gwp='./gradlew publish'
alias gwcb='./gradlew clean build'
alias gwbp='./gradlew build publish'
alias gwcbp='./gradlew clean build publish'
alias gwu='./gradlew wrapper --distribution-type=all --gradle-version'

alias bru='brew update && brew upgrade && brew cleanup -s && brew doctor'
