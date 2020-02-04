#! /bin/bash

# --------------------------------------------
#
# This script assume, you have installed:
#    Fedora 30
#
# Run as root
#
# --------------------------------------------

set -xv

# CLI software
SHELL="bash bash-completion"
GIT="git gitg"
COMPILE_TOOLSET="gcc gcc-c++ make cmake gdb"
EDITOR="vim nano"
SSH="openssh openssh-server"
TOOLS="mc tree ntfs-3g zip unzip tar wget curl lshw"
PYTHON="python python2 python3"

dnf install -y --nogpgcheck $SHELL $GIT $COMPILE_TOOLSET $EDITOR $SSH $TOOLS $PYTHON || exit

# More repositories
RPMFUSION="https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
REPOS="fedora-workstation-repositories fedora-repos-rawhide $RPMFUSION"

dnf install -y --nogpgcheck $REPOS || exit

# GUI software
GUI_EDITOR="gedit"
WEB_BROWSER="chromium firefox"
IRC="hexchat"
OFFICE="libreoffice"
TERMINAL="cool-retro-term"
VIDEO="vlc"
# Desktop environments
DE="@cinnamon-desktop-environment @lxde-desktop-environment"

dnf install -y --nogpgcheck $GUI_EDITOR $WEB_BROWSER $IRC $OFFICE $TERMINAL $VIDEO $DE || exit


GARBAGE="dnfdragora shotwell pidgin thunderbird leafpad galculator xpad xfburn parole xawtv xed"
for pkg in $GARBAGE ; do dnf remove -y $pkg; done

dnf update -y --nogpgcheck

# --------------------------------

# Start SSH server
systemctl enable sshd
# some sed ?
systemctl start sshd

# --------------------------------

# Add user "lod"
useradd -m lod && echo -e "lod:lod" | chpasswd lod
usermod -c "Hvězdná Loď" lod

# --------------------------------

# Set Time and Date
ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime

# --------------------------------


