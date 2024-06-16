#!/bin/sh

# Install chezmoi, init and apply
# Run: sh -c "$(wget -qO- https://raw.githubusercontent.com/phenates/dotfiles/master/install.sh)"

set -e

nocolor=$(tput sgr0)
cyan=$(tput setaf 6)

echo ""
echo $cyan"------ dotfiles management ------"$nocolor

if [ ! "$(chezmoi --version)" ]; then
  echo "chezmoi installation"
  if [ "$(wget --version)" ]; then
    sh -c "$(wget -qO- get.chezmoi.io/lb)"
  elif [ "$(curl -v)" ]; then
    sh -c "$(curl -fsLS get.chezmoi.io/lb)"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  echo "chezmoi seems to be already installed"
fi
