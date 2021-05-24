#!/bin/bash

brew install gpg

gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable

echo "Sourcing RVM and reloading shell"
. /Users/$(whoami)/.rvm/scripts/rvm

echo "RVM requirements"
rvm requirements

echo "Installing ruby-2.7.1"
rvm install ruby-2.7.1

echo "Setting ruby-2.7.1 as default"
rvm --default use ruby-2.7.1

echo "Install bundler"
gem install bundler --no-document

# This wouldn't work because it is executed in a different
# shell which gets invoked inside the script and not the
# terminal window
echo "...again"
. /Users/$(whoami)/.rvm/scripts/rvm
