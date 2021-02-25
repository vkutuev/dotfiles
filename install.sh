#!/bin/bash

BIN_DIR="${HOME}/bin"
CONF_DIR="${HOME}/.config"
GITHUB_NOTIFICATION_TOKEN_FILE="${HOME}/.secrets/github-notification.token"

read -r -p "Do you want to install configs for i3, rofi, polybar, kitty [Y/n] " response
response=${response,,} #tolower
if [[ ! $response =~ ^(yes|y| ) && -n $response ]]; then
    exit
fi

# Create ~/bin
echo Create ~/bin
mkdir -p "${BIN_DIR}"

#+------------------------------------------+
#|                     i3                   |
#+------------------------------------------+
echo i3 && \
mkdir -p "${CONF_DIR}/i3/" && \
cp -p i3/config "${CONF_DIR}/i3/config"

#+------------------------------------------+
#|                    rofi                  |
#+------------------------------------------+
echo rofi && \
cp -p rofi/rofi_run.sh "${BIN_DIR}/rofi_run.sh" && \
chmod 755 "${BIN_DIR}/rofi_run.sh"

#+------------------------------------------+
#|                   polybar                |
#+------------------------------------------+
echo polybar && \
cp -p polybar/bar.sh "${BIN_DIR}/bar.sh" && \
chmod 755 "${BIN_DIR}/bar.sh" && \
cp -p polybar/config "${CONF_DIR}/polybar/config"

# github notification token
echo "Creating file with token for github module"
mkdir "${HOME}/.secrets/" -m 750 && \
touch "${GITHUB_NOTIFICATION_TOKEN_FILE}" && \
chmod 640 "${GITHUB_NOTIFICATION_TOKEN_FILE}"

#+------------------------------------------+
#|                    kitty                 |
#+------------------------------------------+
echo kitty && \
mkdir -p "${CONF_DIR}/kitty/" && \
cp -p kitty/* "${CONF_DIR}/kitty/"

