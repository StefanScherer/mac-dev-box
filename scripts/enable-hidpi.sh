#!/bin/bash

# Enable HiDPI mode, from https://gist.github.com/adamstac/8347083
sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true

echo "In System Preferences, set the display to 'scaled' using (HiDPI)."
