#!/bin/sh
source scripts/utils.sh


if test ! $(xcode-select -p); then
    e_header "Installing XCode Command Line Tools"
    xcode-select --install
    sleep 1
    osascript <<EOD
        tell application "System Events"
            tell process "Install Command Line Developer Tools"
            end tell
        end tell
EOD
else
  e_header "XCode Command Line Tools already installed"
  exit
fi
e_success "XCode Command Line Tools installed"