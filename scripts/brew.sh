#!/bin/sh
source scripts/utils.sh

# BREW
if test ! $(which brew); then
  e_header "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  e_header "Updating Homebrew"
  brew update
fi
e_success "brew updated done!"



brew install mas

mas upgrade
e_success "apple store apps upgrade done!"

# run Brewfile
e_header "Run Brewfile!"
brew tap Homebrew/bundle
brew bundle
e_success "brew and cask done!"