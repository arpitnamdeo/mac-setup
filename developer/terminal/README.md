MacBook - Terminal Setup
========================

Setup a better terminal experience on your Mac. 
This guide will help you setup iTerm as a terminal emulator using Zsh shell and some basic tools to help configure themes, completions etc. on the shell.

_This guide assumes basic and developer setup has been performed on the Mac._ 


## Applications and Tools
_All the following commands are to be run using the Terminal app in MacOS_
1. Install iTerm2 as terminal emulator
    ```
    brew cask install iterm2
    ```
2. Install GNU Coreutils
    ```
    brew install coreutils
    ```
3. Create base shell config directory
    ```
    mkdir ~/.shell_config
    ```
3. Get [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
    ```
    git clone https://github.com/romkatv/powerlevel10k.git ~/.shell_config/powerlevel10k
    ```
4. Install Fonts
Install fonts for use with iTerm
    ```
    brew tap homebrew/cask-fonts
    brew install font-fira-code-nerd-font font-fira-mono-nerd-font
    ```
5. Get a color scheme for iTerm from `https://iterm2colorschemes.com/`
_The color scheme will be in the "schemes" folder in the downloaded archive with a .itermcolors_
6. Install Zsh plugins
    ```
    brew install zsh-autosuggestions zsh-completions zsh-syntax-highlighting
    ```


## Configure iTerm
1. Open iTerm application
2. Open "iTerm > Preferences..."
3. Select "Profiles" section on top and then "Default" profile from left menu
	1. Configure shell to use
		1. Select "General" tab
		2. Under "Command" section select the radio for "Command"
		3. Enter "/bin/zsh"
	2. Configure colors
		1. Select "Colors" tab
		2. Select dropdown for "Color Presets..."
		3. Click on "Import..."
		4. Select the ".itermcolors" file downloaded earlier from `https://iterm2colorschemes.com/`
	3. Configure font
		1. Select "Text" tab
		2. Click on "Change Font"
		3. Select "Fura Code Retina Nerd Font Complete"
		4. Check "Use ligatures"
		5. Check "Use a different font for non-ASCII text"
		6. Click on "Change Font" for Non-ASCII Font
		7. Select "Fura Code Retina Nerd Font Complete Mono"
		8. Check "Use ligatures"
	4. Configure window size as per preference "Window" tab by setting columns and rows


## Zsh configuration
1. Copy files from this repo's shell_config folder to `~/.shell_config` folder on your machine
2. Create a .zshrc file
    ```
    touch ~/.zshrc
    ```
3. Open .zshrc for editing 
    ```
    subl ~/.zshrc
    ```
4. Paste the contents of "zshrc" file in this repo to the opened .zshrc file and save


## Extras
No need to install `zsh` separtely. MacOS has Zsh available at `/bin/zsh`. Use the built in shell in iTerm configuration as described above.

If using zsh (z-shell) and `/usr/local/bin` is not on the path (check with `echo $PATH`) then run the following from Terminal app and reboot machine

`sudo launchctl config user path "/usr/local/bin:$PATH"`

