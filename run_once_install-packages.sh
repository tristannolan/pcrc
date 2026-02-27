#!/bin/sh

pkg_exists() {
	command -v "$1" >/dev/null 2>&1
}

log() {
	printf "%s: %s\n" "$(date +%H:%M:%S)" "test"
}

log "install packages"


if username equals "tristannolan" {
}
if hostname contains "server" {
}
