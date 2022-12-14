#!/bin/bash

WORKDIR=$(pwd)
BASEDIR=$(dirname $(realpath "$0"))
BINDIR="${HOME}/bin"
CONFDIR="${HOME}/.config"

read -r -p "Do you want to install packages from package_list.txt [Y/n] " response
response=${response,,} #tolower
if [[ $response =~ ^(yes|y| ) || -z $response ]]; then
    sudo pacman -S --needed --noconfirm - < package_list.txt
fi

read -r -p "Do you want to install AUR packages from aur_packages.txt [Y/n] " response
response=${response,,} #tolower
if [[ $response =~ ^(yes|y| ) || -z $response ]]; then
    cd /tmp
    for pkg in $(cat "${BASEDIR}/aur_packages.txt")
    do
        git clone "https://aur.archlinux.org/${pkg}.git" \
        && cd $pkg \
        && makepkg -si --noconfirm \
        && cd .. \
        && rm -rf $pkg
    done
    cd $WORKDIR
fi

read -r -p "Do you want to install configs for fish, i3, rofi, polybar, kitty, vim, ranger [Y/n] " response
response=${response,,} #tolower
if [[ $response =~ ^(yes|y| ) || -z $response ]]; then

# Create ~/bin
echo "Create BINDIR: ${BINDIR}" \
&& mkdir -p "${BINDIR}"

#+------------------------------------------+
#|                    fish                  |
#+------------------------------------------+
echo fish config \
&& chsh -s /usr/bin/fish \
&& mkdir -p "${CONFDIR}/fish" \
&& cp -p "${BASEDIR}/fish/config.fish" "${CONFDIR}/fish/config.fish"

#+------------------------------------------+
#|                     i3                   |
#+------------------------------------------+
echo i3 \
&& mkdir -p "${CONFDIR}/i3/" \
&& cp -p "${BASEDIR}/i3/config" "${CONFDIR}/i3/config"

#+------------------------------------------+
#|                    rofi                  |
#+------------------------------------------+
echo rofi \
&& ROFIDIR="${BASEDIR}/rofi"
&& cp -p "${ROFIDIR}/rofi_run.sh" "${BINDIR}/rofi_run.sh" \
&& mkdir -p "${CONFDIR}/rofi" \
&& cp -p "${ROFIDIR}/config.rasi" "${CONFDIR}/rofi/config.rasi"
&& chmod 755 "${BINDIR}/rofi_run.sh"

#+------------------------------------------+
#|                   polybar                |
#+------------------------------------------+
echo polybar \
&& POLYBARDIR="${BASEDIR}/polybar"
&& cp -p "${POLYBARDIR}/bar.sh" "${BINDIR}/bar.sh" \
&& chmod 755 "${BINDIR}/bar.sh" \
&& mkdir -p "${CONFDIR}/polybar"
cp -p "${POLYBARDIR}/config" "${CONFDIR}/polybar/config"

#+------------------------------------------+
#|                    kitty                 |
#+------------------------------------------+
echo kitty \
&& mkdir -p "${CONFDIR}/kitty/" \
&& cp -p "${BASEDIR}/kitty/*" "${CONFDIR}/kitty/"

#+------------------------------------------+
#|                     vim                  |
#+------------------------------------------+
echo vim \
&& cp "${BASEDIR}/vim/.vimrc" ${HOME}

#+------------------------------------------+
#|                    ranger                |
#+------------------------------------------+
echo ranger \
&& python -m pip install pillow ranger-fm \
&& mkdir -p "${CONFDIR}/ranger" \
&& cp -p "${BASEDIR}/ranger/rc.conf" "${CONFDIR}/ranger/rc.conf"

fi

read -r -p "Do you want to install useful scripts $(ls -m ${BASEDIR}/scripts) [Y/n] " response
response=${response,,} #tolower
if [[ $response =~ ^(yes|y| ) || -z $response ]]; then
    cp -p "${BASEDIR}/scripts/*" "${BINDIR}/"
fi

read -r -p "Do you want to install python-3.9 [Y/n] " response
response=${response,,} #tolower
if [[ $response =~ ^(yes|y| ) || -z $response ]]; then
    pyenv install 3.9
fi
