#!/bin/sh

# Usage
# Create a bootable usb drive with an arch iso
# Boot the vm/pc

# curl https://raw.githubusercontent.com/tristannolan/dotfiles/refs/heads/main/install/arch-base.sh -o arch-base.sh
# vim arch-base.sh
# chmod +x arch-base.sh
# ./arch-base.sh

# Settings
safe_to_run=false

keyboard_layout=us

# Arguments
case "$1" in
	unsafe|true|1)
		unsafe=true
		;;
	*)
	unsafe=false
	;;
esac

# Safety net
if [ "$safe_to_run" != "true" ] && [ "$unsafe" != "true" ]; then
	echo "Aborting - Not safe to run"
	echo "Please review and modify settings before continuing"
	exit 1
fi

# Keyboard layout
echo "loadkeys $keyboard_layout"
