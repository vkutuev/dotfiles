#!/bin/bash

read -r -p "Do you want to uninstall configs for i3, rofi, polybar, kitty [Y/n] " response
response=${response,,}
if [[ ! $response =~ ^(yes|y| ) && -n $response ]]; then
    exit
fi

BIN_DIR="${HOME}/bin"
CONF_DIR="${HOME}/.config"
GITHUB_NOTIFICATION_TOKEN_FILE="${HOME}/.secrets/github-notification.token"

# i3
echo i3 && \
rm -f "${CONF_DIR}/i3/config"

# rofi
echo rofi && \
rm -f "${BIN_DIR}/rofi_run.sh"

# polybar
echo polybar && \
rm -f "${BIN_DIR}/bar.sh" && \
rm -f "${CONF_DIR}/polybar/config"

# kitty
echo kitty && \
rm -f "${CONF_DIR}/kitty/*"

read -r -p "Do you want to remove ~/.secrets/github-notification.token [Y/n] " response
response=${response,,}
if [[ $response =~ ^(yes|y| ) || -z $response ]]; then
    rm -f "${GITHUB_NOTIFICATION_TOKEN_FILE}"
fi

