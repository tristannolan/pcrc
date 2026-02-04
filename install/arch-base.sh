#!/bin/bash
set -euo pipefail

# Usage
# Create a bootable usb drive with an arch iso
# Boot the vm/pc
# curl to download raw file
# Configure and run

##############
#  SETTINGS  #
##############
mode=safe

keyboard_layout=us
boot_mode=""
network_available=false

###############
#  ARGUMENTS  #
###############

usage() {
	echo "Usage: $0 [options...]"
	echo "-m	safe|dry|live"
}

while getopts ":hm:" opt; do
	case "${opt}" in
		h)
			usage
			exit 0
			;;
		m)
			case "${OPTARG}" in
				safe|dry|live) 
					mode="${OPTARG}" 
					;;
				*) 
					echo "Invalid Mode: $OPTARG"
					usage
					exit 1
					;;
			esac
			;;
		*)
			echo "Invalid Argument: ${OPTARG}"
			usage
			exit 1
		;;
	esac
done
shift $((OPTIND - 1))

###############
#  FUNCTIONS  #
###############

abort() {
	local reason=${1:-}
	local info=${2:-}

	if [ -z "$reason" ]; then
		echo "Aborting"
		exit 1
	fi

	echo "Aborting - $reason"
	if [ -n "$info" ]; then
		echo "$info"
	fi
	exit 1
}

#########
#  DRY  #
#########

if [ "$mode" = "safe" ]; then
	abort "Will not run in safe mode" "Please review and modify settings before continuing"
fi

# Keyboard layout
echo "Keyboard Layout: $keyboard_layout"

# Boot Mode
if [ -d /sys/firmware/efi ]; then
	fw_size=$(cat /sys/firmware/efi/fw_platform_size)
	case "$fw_size" in
		64)
			echo "Boot Mode: 64-bit x64 UEFI"
			boot_mode="uefi"
			;;
		32)
			abort "Automatic install not configured for 32-bit UEFI"
			;;
		*)
			abort "Unknown platform size" "Unable to determine if UEFI is 64 or 32 bit"
			;;
	esac
else
	echo "Boot Mode: BIOS"
	boot_mode="bios"
fi

# Internet
if ping -c 1 8.8.8.8 &> /dev/null; then
	echo "Network Available"
	network_available=true
else
	abort "Network unavailable" "Please review device and installer config"
fi

##########
#  LIVE  #
##########

if [ "$mode" = "dry" ]; then
	echo "Exiting Dry Run - No commands have been run"
	exit 0
fi

if [ "$mode" = "live" ]; then
	read -r -p "Proceed with live installation? [y/N]: " confirm
	case "$confirm" in
		y|Y|yes|YES) ;;
		*) abort "User aborted"
	esac
fi

loadkeys $keyboard_layout
timedatectl

# create partitions here
