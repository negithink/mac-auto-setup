#!/bin/bash
set -uo pipefail

cat <<EOS

 AkkeyLab

 The elapsed time does not matter.
 Because speed is important.

EOS

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_AUTO_UPDATE=1

#
# Mac App Store apps install
#
echo " ---- Mac App Store apps -----"
brew bundle --file="${SCRIPT_DIR}/Brewfile.appstore"

echo " ------------ END ------------"
