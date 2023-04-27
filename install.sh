#!/bin/bash

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Populating git user inside git_config
echo "Setting up git user file!"
read -p "Enter your username [ (b) bypass this step ]: " git_user

# Scripts and rcs
ln -s $SCRIPT_PATH/git_config /home/$USER/.gitconfig
ln -s $SCRIPT_PATH/vim_config /home/$USER/.vimrc
ln -s $SCRIPT_PATH/init_script.zsh /home/$USER/.oh-my-zsh/custom/init_script.zsh

if [ $git_user != "b" ]; then
    read -p "Enter your git email: " git_email

    if [ ! -z "$git_email" ]; then
        # Append new settings to git_config file
        echo "[user]
            name = $git_user
            email = $git_email" >> /home/$USER/.gitconfig
    fi
fi

