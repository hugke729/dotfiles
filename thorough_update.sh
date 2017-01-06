#!/bin/zsh
# Programs
echo '\n\n Programs'
my_rclone.sh ~/Programs/WebTide Programs/WebTide
my_rclone.sh ~/Programs/fortran Programs/fortran

# MITgcm
echo '\n\n MITgcm'
my_rclone.sh ~/MITgcm/realistic/ MITgcm/realistic
my_rclone.sh ~/MITgcm/idealised/ MITgcm/idealised
my_rclone.sh ~/MITgcm/pkg/sshr MITgcm/pkg/sshr

# Data
echo '\n\n Data'
my_rclone.sh ~/PhD/Data/Model PhD/Data/Model
my_rclone.sh ~/PhD/Data/Penny_Strait PhD/Data/Penny_Strait
my_rclone.sh ~/PhD/Data/Shipboard/CTD/processed PhD/Data/Shipboard/CTD/processed
my_rclone.sh ~/PhD/Data/Shipboard/ADCP/processed PhD/Data/Shipboard/ADCP/processed
my_rclone.sh ~/PhD/Data/Shipboard/MVP/transects PhD/Data/Shipboard/MVP/transects

# PhD
echo '\n\n PhD'
my_rclone.sh ~/PhD/ANHA PhD/ANHA
my_rclone.sh ~/PhD/Classes PhD/Classes
my_rclone.sh ~/PhD/Committee PhD/Committee
my_rclone.sh ~/PhD/Conferences PhD/Conferences
my_rclone.sh ~/PhD/Field Work PhD/Field Work
my_rclone.sh ~/PhD/Figures PhD/Figures
my_rclone.sh ~/PhD/Literature\ Analysis PhD/Literature\ Analysis
my_rclone.sh ~/PhD/Maps PhD/Maps
my_rclone.sh ~/PhD/Notes PhD/Notes
my_rclone.sh ~/PhD/Other PhD/Other
my_rclone.sh ~/PhD/Papers PhD/Papers
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
my_rclone.sh ~/.config/devilspie2 configs/other
my_rclone.sh ~/.config/matplotlib configs/other
my_rclone.sh ~/.config/Mendeley\ Ltd\. configs/other
my_rclone.sh ~/.config/mpv configs/other
my_rclone.sh ~/.config/sublime-text-3/Packages configs/sublime
my_rclone.sh ~/.config/synapse configs/other
