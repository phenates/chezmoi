#!/bin/sh

# Install chezmoi and/or init and apply
# Run: sh -c "$(wget -qO- https://raw.githubusercontent.com/phenates/dotfiles/master/install.sh)"

set -e # -e: exit on error

NOCOLOR=$(tput sgr0)
CYAN=$(tput setaf 6)

echo ""
echo $CYAN">>>>> dotfiles management <<<<<"$NOCOLOR

if [ ! "$(command -v chezmoi)" ]; then
  echo $CYAN"--> chezmoi installation"$NOCOLOR
  bin_dir="$HOME/.local/bin"

  echo $GREEN"install option: [1]: install (default); [2]: install and init; [3]: install, init and apply"$NOCOLOR
  read -r RES
  case "$RES" in
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
