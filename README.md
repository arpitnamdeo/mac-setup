MacBook Setup
=============

## IBM Mac Setup
### Setup Macbook as per [Setup My Mac](https://ibm.biz/setupmymac) `https://ibm.biz/setupmymac`

### Install IBM recommended apps from Mac@IBM App Store
1. AppCleaner
2. Office Suite
3. ILC
4. WebEx
5. Other apps as needed

## Core Applications and Tools
_All the following commands are to be run using the Terminal app in MacOS_
1. Install Xcode CLI tools
`xcode-select --install`
2. Install [Home-brew](https://brew.sh/)
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
3. Install Google Chrome and Firefox
`brew cask install google-chrome firefox`
4. Install useful Mac applications
`brew cask install spectacle sublime-text`

## Developer Applications, Software and Tools
1. Install git and tree
`brew install git tree`
2. Install IDEs and other development tools
`brew cask install visual-studio-code intellij-idea-ce postman docker`
3. Install Quick Look plugins
_Refer https://github.com/sindresorhus/quick-look-plugins for more_
`brew cask install qlcolorcode qlstephen qlvideo qlmarkdown quicklook-json quicklook-csv webpquicklook`

### NodeJS
1. Install [NVM (Node Version Manager)](https://github.com/creationix/nvm)
`curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash`
2. Install NodeJS and NPM
_Change NodeJS version as needed_
`nvm install 6` 

### Java  
1. Install [SDKMan!](https://sdkman.io)
_Refer to SDKMan! documentation for more info on installing multiple versions, using JDK and detting a default version_
`curl -s "https://get.sdkman.io" | bash`
2. Install JDK
	1. List JDK versions available 
	`sdk list java`
	2. Select and install JDK; use the version as listed from above command; for e.g the following installs Oracle JDK Version 8.0.181
	`sdk install java 8.0.181-oracle`
	3. Select and use installed JDK 
	`sdk use java 8.0.181-oracle`
	`sdk default java 8.0.181-oracle`
3. Install Maven
**_Prefer using [Maven Wrapper](https://github.com/takari/maven-wrapper) where possible for Java projects_**
`sdk install maven`
4. Install Gradle
**_Prefer using [Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html) where possible for Java projects_**
_Change Gradle version as required_
`sdk install gradle 4.4.1`
`sdk use gradle 4.4.1`
`sdk default gradle 4.4.1`
4. _[Optional]_ Install quicklook gralde plugin
`brew cask install qlgradle`

## SSH Setup
SSH provides a secure and faster auth mechanism when working with differen servers, hosts and git repos
### Create SSH identities
**It is recommended to not use the default identity everywhere but have a separate identity file for each auth**
1. Default identity 
Use the following command to create a default identity (`~/.ssh/id_rsa`); Press `enter` key for name and optionally choose a passphrase when prompted
`ssh-keygen -t rsa -b 4096`
2. IBM Github (github.ibm.com)
When asked for a name for the identity file type "id_rsa_ibm_github"
`cd ~/.ssh`
`ssh-keygen -t rsa -b 4096 -C "<<your IBM email address>>"`
3. Other identities
Use the following commands to create more identities as required; when asked for a name provide a name as appropriate; prefer prefix "id_rsa_" in name
`cd ~/.ssh`
`ssh-keygen -t rsa -b 4096 -C "<<email address to associate with identity>>"`

### Configure SSH to use multiple identities 
To allow SSH to use specific identities when connecting to different hosts, configuration is required
_There is a sample file in this repository for reference_
1. Create SSH Config file
`touch ~/.ssh/config`
2. Open file in text editor (for e.g. `subl ~/.ssh/config` to open the file in Sublime Text) and add the following text
	```
	# Default properties
	AddKeysToAgent yes
	UseKeychain yes
	IdentitiesOnly yes

	# Default host
	Host *
		IdentityFile ~/.ssh/id_rsa

	# Key for IBM Github
	Host github.ibm.com
	  	HostName github.ibm.com
	  	User git
	  	IdentityFile ~/.ssh/id_rsa_ibm_github
	  	
	# Add more Host sections similar to the one above as needed for other identities
	```
3. Refer to the following for more info on SSH Configuration
	1. https://gist.github.com/jexchan/2351996
	2. https://stackoverflow.com/questions/3225862/multiple-github-accounts-ssh-config
	3. https://medium.freecodecamp.org/manage-multiple-github-accounts-the-ssh-way-2dadc30ccaca
	4. https://www.ssh.com/ssh/config/


## Developer workflow setup
**Prefer lowercase names for folders as its easier and faster to navigate using command line**
1. Use a base folder for all development work 
_Create "workspace" folder under user home folder_
`mkdir ~/workspace`
2. Create any default files such as .gitignore_Default, .editorconfig, .prettierrc etc. in "workspace" folder
3. Create a new folder under this one for each client and under the client folder keep client specific projects


## Git Configuration
1. Git user name and email
`git config --global user.email "<<email address>>"`
`git config --global user.name "<<full name>>"`
2. Configure git to use correct line endings for Mac
`git config --global core.autocrlf input`
3. Configure defalt editor for git
_Following sets VS Code as the default editor_
`git config --global core.editor 'code --wait'`
4. Create default gitignore file
	1. Create file `~/workspace/.gitignore_default`
	`touch ~/workspace/.gitignore_default`
	2. Configure git to use the file created above as excludesfile 
	`git config --global core.excludesfile ~/workspace/.gitignore_default`
	3. Edit default gitignore file `~/workspace/.gitignore_default`
		1. Open file in text editor
		`subl ~/workspace/.gitignore_default`
		2. Add required default gitignore rules to the file; use [GitHub Gitignore](https://github.com/github/gitignore) repository for some defaults based on OS, IDE, language etc.
		3. _There is a sample file in this repository for reference_


## EditorConfig 
Using EditorConfig allows for more consitent files by default
1. Create a root [EditorConfig](https://editorconfig.org/) file 
_There is a sample file in this repository for reference_
`touch ~/workspace/.editorconfig`
2. Edit file
	1. Open file in text editor
	`subl ~/workspace/.editorconfig`
	2. Copy and paste the following text
	_Add/update other properties as needed_
		```
		# EditorConfig is awesome: https://EditorConfig.org

		# top-most EditorConfig file
		root = true

		# Unix-style newlines with a newline ending every file
		# Default indent size and style
		[*]
		charset = utf-8
		end_of_line = lf
		indent_size = 4
		indent_style = space
		trim_trailing_whitespace = true
		insert_final_newline = true

		## experimental properties
		spaces_around_operators = true

		# Matches markdown files
		[*.{md,MD,markdown}]
		max_line_length = 120
		trim_trailing_whitespace = false

		# Matches JS files
		[*.{js,json}]
		indent_size = 2

		# Matches the exact files either package.json or .travis.yml
		[{package.json,.travis.yml}]
		indent_style = space
		indent_size = 2
		```

