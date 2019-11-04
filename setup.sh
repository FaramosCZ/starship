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
COMPILE_TOOLSET="gcc-c++ make cmake gdb"
EDITOR="vim nano"
SSH="openssh openssh-server"
TOOLS="mc tree ntfs-3g zip unzip tar"
PYTHON="python python2 python3"

dnf install -y --nogpgcheck $SHELL $GIT $COMPILE_TOOLSET $EDITOR $SSH $TOOLS $PYTHON

# More repositories
RPMFUSION="https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
REPOS="fedora-workstation-repositories fedora-repos-rawhide $RPMFUSION"

dnf install -y --nogpgcheck $REPOS

# GUI software
GUI_EDITOR="gedit"
WEB_BROWSER="google-chrome-stable firefox"
IRC="hexchat"
OFFICE="libreoffice"
TERMINAL="cool-retro-term"
VIDEO="vlc"
# Desktop environments
DE="@cinnamon-desktop-environment @lxde-desktop-environment"

dnf install -y --nogpgcheck $GUI_EDITOR $WEB_BROWSER $IRC $OFFICE $TERMINAL $DE $VIDEO



dnf remove -y "xed dnfdragora"

dnf update -y --nogpgcheck

# --------------------------------

# start sshd
# print IP
# uzivatele, jmena, hesla
# klavesnice