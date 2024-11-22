#!/bin/bash

sudo paccache -r  # sudo pacman -Sycc
sudo journalctl --vacuum-size=256M
sudo systemd-tmpfiles --clean
sudo rm -rf ~/.cache/*
flatpak uninstall --unused
