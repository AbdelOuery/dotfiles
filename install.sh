#!/bin/bash

# Create symbolic links
########################

# Fonts
ln -sf $PWD/fonts ~/.fonts/fonts

# Zsh Themes
ln -sf $PWD/zsh-themes/* ~/.oh-my-zsh/custom/themes/

# Konsole colorschemes
ln -sf $PWD/colorschemes/*.colorscheme ~/.local/share/konsole/

# Git config
ln -sf $PWD/gitconfig ~/.gitconfig
