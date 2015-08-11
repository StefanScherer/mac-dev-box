#!/bin/bash

brew install nvm
mkdir -p ~/.nvm
cp $(brew --prefix nvm)/nvm-exec ~/.nvm/

echo 'export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh' >> ~/.bash_profile
source ~/.bash_profile

nvm install iojs
nvm alias default iojs
