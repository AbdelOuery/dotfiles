#!/bin/bash

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "Setting up vim plugins..."
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/dist/start/vim-airline-themes

echo "Setting up configuration files..."
mkdir -p $HOME/.config/ghostty
mkdir -p $HOME/.config/niri/config.kdl

# Scripts and rcs
ln -s $SCRIPT_PATH/git_config $HOME/.gitconfig
ln -s $SCRIPT_PATH/vim_config $HOME/.vimrc
ln -s $SCRIPT_PATH/ghostty_config.ghostty $HOME/.config/ghostty/config.ghostty

# Populating git user inside git_config
echo "Setting up git user file..."
read -p "Enter your username [ (b) bypass this step ]: " git_user

if [ $git_user != "b" ]; then
    read -p "Enter your git email: " git_email

    if [ ! -z "$git_email" ]; then
        # Append new settings to git_config file
        echo "[user]
            name = $git_user
            email = $git_email" >> $HOME/.gitconfig
    fi
fi

