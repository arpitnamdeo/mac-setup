MacBook - Basic Setup
=====================

## Core Applications and Tools
_All the following commands are to be run using the Terminal app in MacOS_
1. Install Xcode CLI tools
	```
	xcode-select --install
	```
2. Install [Home-brew](https://brew.sh/)
	```
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	```
3. Turn off MacOS quarantine and Homebrew analytics
	```
	sudo defaults write com.apple.LaunchServices LSQuarantine -bool NO
	brew analytics off
	```
5. Install Google Chrome and Firefox
	```
	brew install google-chrome firefox
	```
5. Install useful Mac applications
	```
	brew install 1password spectacle sublime-text
	```

## Setup for application development 
To setup Mac for development, refer to _"developer"_ setup guide
