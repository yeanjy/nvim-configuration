#!/bin/bash

echo "This script will backup nvim config and delete:"
echo " - ~/.config/nvim -> ~/.config/nvim.backup"
echo " - ~/.local/share/nvim/*"
echo " - ~/.cache/nvim/*"
echo "And install the new configuration"
echo "Are you sure? [y/N]: "

read -r choice
if [[ $choice != "y" && $choice != "Y" ]]; then
    exit 1
fi
mv ~/.config/nvim ~/.config/nvim.backup
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
unzip nvim.zip -d ~/.config
echo "Done"
