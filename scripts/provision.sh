#!/bin/bash

# install Xcode Command Line Tools
git --help >/dev/null 2>&1
if [ $? -gt 0 ]; then
  if [ -f /vagrant/resources/command_line_tools_for_osx_mavericks_april_2014.dmg ]; then
    hdiutil attach "/vagrant/resources/command_line_tools_for_osx_mavericks_april_2014.dmg"
    pushd "/Volumes/Command Line Developer Tools/"
    sudo installer -verbose -pkg "Command Line Tools (OS X 10.9).pkg" -target /
    popd
    sleep 5
    hdiutil detach /dev/disk1s2
  else
    echo "Downloading command_line_tools_for_osx_mavericks_april_2014"
    curl -O -L http://swcdn.apple.com/content/downloads/42/47/031-00536/0e3xru4xatuj4v9wb0y113nirfvnz34v8d/CLTools_Executables.pkg
    curl -O -L http://swcdn.apple.com/content/downloads/42/47/031-00536/0e3xru4xatuj4v9wb0y113nirfvnz34v8d/MacOSX10_9_SDK.pkg
    sudo installer -verbose -pkg "CLTools_Executables.pkg" -target /
    sudo installer -verbose -pkg "MacOSX10_9_SDK.pkg" -target /
    rm CLTools_Executables.pkg
    rm MacOSX10_9_SDK.pkg
  fi
fi

# install homebrew
which brew >/dev/null
if [ $? -gt 0 ]; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew doctor
fi

# install packer.io
which packer >/dev/null
if [ $? -gt 0 ]; then
  brew tap homebrew/binary
  brew install packer
fi

# install caskroom.io
if [ ! -d /usr/local/Library/Taps/caskroom/homebrew-cask ]; then
  brew tap caskroom/cask
  brew install brew-cask
fi

# install vagrantup.com
which vagrant >/dev/null
if [ $? -gt 0 ]; then
  brew cask install vagrant
fi

