#!/bin/bash
if [ -d /vagrant/resources/.ssh/ ]; then
  echo "Copy SSH keys"
  cp -r /vagrant/resources/.ssh ~/
fi

if [ -f /vagrant/resources/.gitconfig ]; then
  echo "Copy Git config"
  cp /vagrant/resources/.gitconfig ~/
fi

if [ -f /vagrant/resources/.npmrc ]; then
  echo "Copy NPM config"
  cp /vagrant/resources/.npmrc ~/
fi

if [ -d /vagrant/resources/.docker ]; then
  echo "Copy Docker config"
  cp -r /vagrant/resources/.docker ~/
fi
