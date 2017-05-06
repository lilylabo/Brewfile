#! /usr/bin/env bash

defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
sudo nvram SystemAudioVolume=%80

# Prevent Gatekeeper Turning Back On Automatically in OS X
sudo defaults write /Library/Preferences/com.apple.security GKAutoRearm -bool NO

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew install rcmdnk/file/brew-file
# add this code to .bash_profile
#if [ -f $(brew --prefix)/etc/brew-wrap ];then
#source $(brew --prefix)/etc/brew-wrap
#fi

brew tap caskroom/cask
brew tap caskroom/versions

# for the Mac App Store
brew install mas

# for Sierra
#brew unlink php70

# install from Brewfile
brew file set_repo -r lilylabo/Brewfile
brew file install

brew cleanup
brew cask cleanup


# OS settings
defaults write com.apple.finder AppleShowAllFiles -bool yes
defaults write com.apple.finder _FXShowPosixPathInTitle -bool yes
defaults write com.apple.finder QLEnableTextSelection -bool yes
killall Finder

defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write -g NSNavPanelExpandedStateForSaveMode -bool yes
