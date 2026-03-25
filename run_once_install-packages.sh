#!/bin/sh

pkg_exists() {
	command -v "$1" >/dev/null 2>&1
}

log() {
	printf "%s: %s\n" "$(date +%H:%M:%S)"
}

log "install packages"

#if [[ username = tristannolan ]]; then
#fi
#if [[ hostname = server ]]; then
#fi
