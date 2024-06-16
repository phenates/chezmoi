#!/bin/sh

# Install chezmoi, init and apply
# Run: sh -c "$(wget -qO- https://raw.githubusercontent.com/phenates/dotfiles/master/install.sh)"

set -e

NOCOLOR=$(tput sgr0)
CYAN=$(tput setaf 6)

echo ""
echo $CYAN">>>>> dotfiles management <<<<<"$NOCOLOR

if [ ! "$(chezmoi --version)" ]; then
  echo $CYAN">>> chezmoi installation"$NOCOLOR
  if [ "$(wget --version)" ]; then
    sh -c "$(wget -qO- get.chezmoi.io/lb)"
  elif [ "$(curl -v)" ]; then
    sh -c "$(curl -fsLS get.chezmoi.io/lb)"
  else
    echo $CYAN">>> To install chezmoi, you must have curl or wget installed."$NOCOLOR
    exit 1
  fi
else
  echo $CYAN">>> chezmoi seems to be already installed"$NOCOLOR
fi
