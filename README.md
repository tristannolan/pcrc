# Chezmoi
## Function
Chezmoi is the manager of all things config. 
Install chezmoi and download the repo to .local/share/chezmoi, then run 
chezmoi apply. All dotfiles will be made available in ~/.config

Made edits by using chezmoi cd, then chezmoi apply.

## Flow
- Install chezmoi (pacman -S chezmoi)
- Clone dotfiles repo to ./local/share/dotfiles
- Rename dotfiles to chezmoi

## Device specific configuration
Chezmoi supports templating and scripting, so it can install programs and config
files per device. Custom variables can be added.

Format: .chezmoi.<var>

A few provided variables make this possible:
- arch          (amd64|arm)
- args          provide from command
- group
- os            (linux|darwin)
- hostname
- username

See the variables section for more information:
https://www.chezmoi.io/reference/templates/variables/

## Identifying a device
