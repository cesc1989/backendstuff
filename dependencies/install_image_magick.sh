#!/bin/bash

echo "Installing Image magick from source"

apt-get update
apt-get -y install \
  libpng-dev \
  libglib2.0-dev \
  zlib1g-dev \
  libbz2-dev \
  libtiff4-dev \
  libjpeg-dev \
  libxml2-dev \
  libx11-dev \
  libfreetype6-dev

mkdir -p ~/image_magick_download

cd ~/image_magick_download
wget http://www.imagemagick.org/download/ImageMagick.tar.gz
tar -xzf ImageMagick.tar.gz

cd ImageMagick-*
echo "Proceding to compile ImageMagick"

sudo ./configure
sudo make
sudo make install
sudo ldconfig /usr/local/lib

echo "Image magick installation is now completed... Hopefully"
