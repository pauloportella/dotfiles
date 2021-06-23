#!/bin/sh
source scripts/utils.sh

# BREW
if test ! $(which brew); then
  e_header "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  e_header "Updating Homebrew"
  brew update
fi
e_success "brew updated done!"



brew install mas


if test ! ${mas account}; then
  e_warning "Please sign into the Mac App Store app manually to continue."
else
  mas upgrade
  e_success "apple store apps upgrade done!"
fi


# run Brewfile
e_header "Run Brewfile!"
brew tap Homebrew/bundle
brew bundle
e_success "brew and cask done!"


e_header "Setting up nodejs"
nvm  install --lts
e_success "node setup done!"