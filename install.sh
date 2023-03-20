#!/bin/bash

# Make ZSH the default shell
chsh -s $(which zsh)

# Install oh-my-zsh
echo 'Install oh-my-zsh'
rm -rf $HOME/.oh-my-zsh
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Add global gitignore
ln -s $HOME/.dotfiles/shell/.global-gitignore $HOME/.global-gitignore
git config --global core.excludesfile $HOME/.global-gitignore

# Symlink zsh prefs
rm $HOME/.zshrc
ln -s $HOME/.dotfiles/shell/.zshrc $HOME/.zshrc

# Symlink vim prefs
rm $HOME/.vimrc
ln -s $HOME/.dotfiles/shell/.vimrc $HOME/.vimrc
rm $HOME/.vim
ln -s $HOME/.dotfiles/shell/.vim $HOME/.vim
# Symlink ack pref
ln -s $HOME/.dotfiles/shell/.ackrc $HOME/.ackrc

# Symlink yarn prefs
#rm $HOME/.yarnrc
#ln -s $HOME/.dotfiles/shell/.yarnrc $HOME/.yarnrc

echo 'Install php'
echo '-----------'
brew install php

echo 'Install composer'
echo '----------------'
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar $HOME/bin/composer

echo 'Install imagick'
echo '---------------'
brew install pkg-config imagemagick
pecl install imagick

echo 'Install memcached'
echo '-----------------'
pecl install memcached

echo 'Install xdebug'
echo '--------------'
pecl install xdebug

echo 'Install redis'
echo '-------------'
pecl install redis

#echo 'Install laravel envoy'
#echo '---------------------'
#composer global require "laravel/envoy=~1.0"

#echo 'Install phpunit-watcher'
#echo '-----------------------'
#composer global require spatie/phpunit-watcher

#echo 'Install mixed-content-scanner-cli'
#echo '---------------------------------'
#composer global require spatie/mixed-content-scanner-cli

echo 'Install laravel valet'
echo '---------------------'
composer global require laravel/valet
valet install
