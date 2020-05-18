#!/bin/bash

echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash

echo "Source to make NVM available"
. ~/.profile

echo "Install latest NodeJS"
nvm install --lts
