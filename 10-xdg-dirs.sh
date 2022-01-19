#!/bin/bash
set -u

echo 'Setting new XDG dirs....'
cp ${HOME}/.config/user-dirs.dirs ${HOME}/.config/user-dirs.dirs.bak

mkdir -p ${HOME}/.desktop
mkdir -p ${HOME}/tmp
mkdir -p ${HOME}/template
mkdir -p ${HOME}/share/
mkdir -p ${HOME}/doc/
mkdir -p ${HOME}/media/music/
mkdir -p ${HOME}/media/picture/
mkdir -p ${HOME}/media/video/
mkdir -p ${HOME}/ref

cat << 'END_CAT' > ${HOME}/.config/user-dirs.dirs
# This file is written by xdg-user-dirs-update
# If you want to change or add directories, just edit the line you're
# interested in. All local changes will be retained on the next run.
# Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
# homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
# absolute path. No other format is supported.
#
XDG_DESKTOP_DIR="$HOME/.desktop"
XDG_DOWNLOAD_DIR="$HOME/tmp/
XDG_TEMPLATES_DIR="$HOME/.template"
XDG_PUBLICSHARE_DIR="$HOME/share"
XDG_DOCUMENTS_DIR="$HOME/doc"
XDG_MUSIC_DIR="$HOME/media/music"
XDG_PICTURES_DIR="$HOME/media/picture"
XDG_VIDEOS_DIR="$HOME/media/video"
END_CAT

echo "new XDG dirs set!"
