#!/bin/bash

# Resources:
#   - http://stackoverflow.com/questions/25460047/cant-install-imagemagick-with-brew-on-mac-os-x-mavericks
#   - https://glucode.com/blog/installing-rmagick-gem-with-imagemagick-and-homebrew-on-macos-10-14-mojave

brew update
brew install imagemagick@6

# Verify installation with command
# 
#     $ convert -version
# 
# If the command is not found by the terminal do:
# 
#     $ brew link imagemagick@6 --force
# 
# Or find the path of the installation and add it to `PATH`
# 
#     /usr/local/opt/imagemagick@6/bin
# 
# See comments beginning with https://github.com/rmagick/rmagick/issues/256#issuecomment-273113469
