#!/bin/bash

git --help >/dev/null 2>&1
if [ $? -gt 0 ]; then
  if [ -f /vagrant/resources/command_line_tools_for_osx_mavericks_april_2014.dmg ]; then
    hdiutil attach "/vagrant/resources/command_line_tools_for_osx_mavericks_april_2014.dmg"
    pushd "/Volumes/Command Line Developer Tools/"
    sudo installer -verbose -pkg "Command Line Tools (OS X 10.9).pkg" -target /
    popd
    hdiutil detach /dev/disk1s2
  else
    echo "You have to download the Command Line Developer Tools once manually with"
    echo ""
    echo "    xcode-select --install"
    echo ""
    echo "and copy them to vagrant shared folder"
    echo ""
    echo "    /vagrant/resources/command_line_tools_for_osx_mavericks_april_2014.dmg"
    echo ""
    echo "Then run vagrant provision again. I apologize for any inconvenience."
    exit 10
  fi
fi

which brew >/dev/null
if [ $? -gt 0 ]; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew doctor
fi
