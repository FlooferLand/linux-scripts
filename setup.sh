#!/bin/bash

###################################################################
# A script i made so i don't have to remember realy long commands #
# Only tested on Debian 11.                                       #
# Script must be ran as root!                                     #
# Script is also sorta unfinished. I may add to it as i see fit.  #
###################################################################

# Flatpak
apt install flatpak
#apt install gnome-software-plugin-flatpak  # For GNOME Software
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
