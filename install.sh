#!/bin/bash

if [ $EUID != 0 ]; then
    echo "Usage: sudo $0 $@"
    exit $?
fi

if [ $EUID = 0 ]; then
    echo "Setting up for: $SUDO_USER"
    
    # Populating git user inside git_config
    echo "Setting up git user file!"
    read -p "Enter your username [ (b) bypass this step ]: " git_user

    if [ $git_user != "b" ]; then
        read -p "Enter your git email: " git_email

        # Append new settings to git_config file
        echo "[user]
            name = $git_user
            email = $git_email" >> ./git_config 
    fi

    # Scripts and rcs
    ln -s ./git_config /home/$SUDO_USER/.gitconfig
    ln -s ./vim_config /home/$SUDO_USER/.vimrc
    ln -s ./init_script.zsh /home/$SUDO_USER/.oh-my-zsh/custom/init_script.zsh
    
    # Konsole settings
    ln -s ./konsole/* /home/$SUDO_USER/.local/konsole/
fi
