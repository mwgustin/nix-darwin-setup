# Gustin Nix configuration setup.

## Overview

Hosts:
- Apollo
    - personal laptop macbook.
    - darwin-rebuild switch --flake .#Apollo
- Helo
    - (new) work laptop macbook.
    - darwin-rebuild switch --flake .#Helo
- Husker
    - tbd (desktop)

## Setup (tbd)
- Install Nix
- Install nix-darwin
  - nix run nix-darwin -- switch --flake ~/nix#<machineName>
- Enable rosetta (`softwareupdate --install-rosetta --agree-to-license`)
- darwin-rebuild given system

