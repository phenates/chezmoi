#!/bin/sh

# Install chezmoi and/or init and apply
# Run: sh -c "$(wget -qO- https://raw.githubusercontent.com/phenates/dotfiles/master/install.sh)"

set -e # -e: exit on error

NOCOLOR=$(tput sgr0)
CYAN=$(tput setaf 6)
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)

echo ""
echo $CYAN"-------------------------------"$NOCOLOR
echo $CYAN">>>>> dotfiles management <<<<<"$NOCOLOR

if [ ! "$(command -v chezmoi)" ]; then
  echo $CYAN"--> chezmoi installation, options:"$NOCOLOR
  echo $GREEN"    Install (default) [1]; Install and Init [2]; Install, Init and Apply [3]; Abord [0]"$NOCOLOR
  read -r RES
  case "$RES" in
  0)
    exit 0
    ;;
  2)
    OPTION="-- init phenates"
    ;;
  3)
    OPTION="-- init --apply phenates"
    ;;
  *)
    OPTION=""
    ;;
  esac

  if [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- get.chezmoi.io/)" $OPTION
  elif [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsLS get.chezmoi.io/)" $OPTION
  else
    echo $CYAN"--> To install chezmoi, you must have curl or wget installed."$NOCOLOR
    exit 1
  fi
else
  echo $CYAN"--> chezmoi seems to be already installed"$NOCOLOR
fi

echo $GREEN""
