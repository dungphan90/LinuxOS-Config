#!/bin/bash

function keybinding() {
  if [ "${HOST}" = "hparch" ]; then
    echo "This is the HP Pavillion laptop."
    XBINDKEYRC=${HOME}/.config/xbindkeysrc_hparch
  else
    echo "This is the Gigabyte AORUS desktop."
    XBINDKEYRC=${HOME}/.config/xbindkeysrc_aorusarch
    # xrandr --auto --output DisplayPort-1 --mode 1920x1080 --right-of DisplayPort-2 &
  fi

  if test -f "${HOME}/.xbindkeysrc"; then
    echo "xbindkeyrc symbolic link exist. No action!"
  else
    echo "xbindkeyrc symbolic link does NOT exist. Make link!"
    ln -s ${XBINDKEYRC} ${HOME}/.xbindkeysrc
  fi

  xbindkeys -f ${HOME}/.xbindkeysrc
}

keybinding

# Key remap
setxkbmap -option caps:escape

