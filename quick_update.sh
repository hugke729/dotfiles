#!/bin/zsh
echo 'Backing up:'

# MITgcm
echo '\n\n MITgcm'
my_rclone.sh ~/MITgcm/realistic/ MITgcm/realistic
my_rclone.sh ~/MITgcm/idealised/ MITgcm/idealised
my_rclone.sh ~/MITgcm/pkg/sshr MITgcm/pkg/sshr

# PhD
echo '\n\n PhD'
my_rclone.sh ~/PhD/ANHA PhD/ANHA
my_rclone.sh ~/PhD/Figures PhD/Figures
my_rclone.sh ~/PhD/Literature\ Analysis PhD/Literature\ Analysis
my_rclone.sh ~/PhD/Maps PhD/Maps
my_rclone.sh ~/PhD/Notes PhD/Notes
my_rclone.sh ~/PhD/Other PhD/Other
my_rclone.sh ~/PhD/Papers/library.bib PhD/Papers/library.bib
my_rclone.sh ~/PhD/Python PhD/Python
my_rclone.sh ~/PhD/SSH\ restoring PhD/SSH\ restoring
my_rclone.sh ~/PhD/TA PhD/TA
my_rclone.sh ~/PhD/Thesis PhD/Thesis

# Documents
echo '\n\n Documents'
my_rclone.sh ~/Documents Documents

# Config and dotfiles
echo '\n\n Config and Dotfiles'
my_rclone.sh ~/.thunderbird/tsqbfv4a.default/prefs.js configs/thunderbird
my_rclone.sh ~/.config/autokey configs/autokey
my_rclone.sh ~/.config/sublime-text-3/Packages configs/sublime
