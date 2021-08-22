### PowerLevel9K Theme load everywhere but in Ubuntu profile
if [[ $LC_TERMINAL = "iTerm2" && $ITERM_PROFILE != "Ubuntu" && $TERM_PROGRAM != "vscode" ]]; then
	# Set PROMPT variables and configuration
	source ~/.shell_config/powerlevel9krc.sh
	# MUST be after setting PowerLevel9k/10k variables to load options in the theme configuration
	#source ~/.shell_config/powerlevel9k/powerlevel9k.zsh-theme
	source ~/.shell_config/powerlevel10k/powerlevel10k.zsh-theme
else
	source ~/.shell_config/p10k.zsh
	source ~/.shell_config/powerlevel10k/powerlevel10k.zsh-theme
	# source "${HOME}/.shell_config/zshrc_ubuntu.sh"
fi
