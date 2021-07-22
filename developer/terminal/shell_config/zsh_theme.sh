### PowerLevel9K Theme load everywhere but in Ubuntu profile
if [[ $LC_TERMINAL = "iTerm2" && $ITERM_PROFILE != "Ubuntu" ]]; then
  source "${HOME}/.shell_config/powerlevel9krc.sh"
else
  source "${HOME}/.shell_config/zshrc_ubuntu.sh"
fi
