#!/bin/bash

brew install nvm
mkdir -p ~/.nvm
cp $(brew --prefix nvm)/nvm-exec ~/.nvm/

echo 'export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh' >> ~/.bash_profile
source ~/.bash_profile

nvm install 4.2.1
nvm alias default 4.2.1

npm install -g flaschenpost
npm install -g forany
npm install -g grunt-cli
npm install -g grunt-init
npm install -g reqd
