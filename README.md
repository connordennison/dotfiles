# connordennison/dotfiles

A fork of [kognise's dotfiles](https://github.com/kognise/dotfiles) with (a few) modifications to tailor it to me.

### Install

**You'll need the bootloader, networking, and `system.stateVersion` parts from your original config to put in `installation.nix`.**

```
sudo cp installation.example.nix installation.nix
sudo nano installation.nix
sudo ln -s "$(pwd)/installation.nix" /etc/nixos/installation.nix

sudo rm /etc/nixos/configuration.nix
sudo ln -s "$(pwd)/configuration.nix" /etc/nixos/configuration.nix

sudo nixos-rebuild switch
```