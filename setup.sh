#! /usr/bin/env bash

defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
sudo nvram SystemAudioVolume=%80

# Prevent Gatekeeper Turning Back On Automatically in OS X
sudo defaults write /Library/Preferences/com.apple.security GKAutoRearm -bool NO

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew tap caskroom/cask
brew tap caskroom/versions

# install from Brewfile
brew file set_repo
# input 'lilylabo/Brewfile'
brew file install

brew cleanup
brew cask cleanup
