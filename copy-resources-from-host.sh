#!/bin/bash
echo "Use at your own risk! Do not use SSH keys with passphrase!"
mkdir -p resources/
mkdir -p resources/.ssh/
echo "Copy SSH keys"
cp ~/.ssh/* resources/.ssh/
echo "Copy Git config"
cp ~/.gitconfig resources/
echo "Copy NPM config"
cp ~/.npmrc resources/
echo "Copy Docker config"
mkdir -p resources/.docker/
cp ~/.docker/config.json resources/.docker/
