#!/bin/bash

echo 'Install homebrew'
echo '----------------'
echo install homebrew
sudo rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#echo 'Install node'
#echo '-----------'
#brew install node@8

#echo 'Install yarn'
#echo '------------'
#brew install yarn

#echo 'Install pkg-config'
#echo '------------------'
#brew install pkg-config

echo 'Install wget'
echo '------------'
brew install wget --overwrite

echo 'Install httpie'
echo '--------------'
brew install httpie

#echo 'Install ncdu'
#echo '------------'
#brew install ncdu

echo 'Install hub'
echo '-----------'
brew install hub

echo 'Install ack'
echo '-----------'
brew install ack

#echo 'Install doctl'
#echo '-------------'
#brew install doctl

#echo 'Install brew-cask'
#echo '-----------------'
#brew tap homebrew/cask-cask
#brew install brew-cask

echo 'Install some nice quicklook plugins'
echo '-----------------------------------'
#brew cask install --no-quarantine --force qlvideo qlcolorcode quicklookapk qlstephen qlmarkdown quicklook-json qlimagesize qlprettypatch quicklook-csv betterzip WebPQuickLook suspicious-package

echo 'Install php'
echo '-----------'
## https://github.com/shivammathur/homebrew-php
brew tap shivammathur/php
brew install php@7.2
brew install php@7.4
brew install php

echo 'Install imagemagick'
echo '-------------------'
brew install imagemagick

#echo 'Install mysql'
#echo '-------------'
brew install mysql

echo 'Install ghostscript'
echo '-------------------'
brew install ghostscript

echo 'Install mackup'
echo '--------------'
#brew install mackup

echo 'Install zsh-autosuggestions'
echo '---------------------------'
brew install zsh-autosuggestions

echo 'Install lame for audio convertion'
echo '---------------------------'
brew install lame
