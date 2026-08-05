#!/bin/bash
set -uo pipefail

cat <<EOS

 AkkeyLab

 The elapsed time does not matter.
 Because speed is important.

EOS

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

#
# Ask for the sudo password once, then keep the timestamp alive for the rest
# of the run so the pkg-based casks never stop to prompt again.
#
echo " -------- sudo (once) --------"
sudo -v || exit 1
while true; do
  sudo -n true
  sleep 50
  kill -0 "$$" 2>/dev/null || exit
done 2>/dev/null &
SUDO_KEEPALIVE_PID=$!
trap 'kill "${SUDO_KEEPALIVE_PID}" 2>/dev/null' EXIT

# Keep Homebrew from stopping for hints, cleanups or an auto-update mid-run.
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_AUTO_UPDATE=1

#
# Install everything declared in the Brewfile: taps, formulae, casks, Mac App
# Store apps and krew plugins, in a single dependency resolution pass.
#
echo " ------ brew bundle ----------"
brew update
brew bundle --file="${SCRIPT_DIR}/Brewfile"

#
# Things brew bundle cannot express.
#
echo " ------ extra tooling --------"
brew gem install cfn-nag
gh ext install meiji163/gh-notify

if command -v npm >/dev/null 2>&1; then
  npm install --global git-open
  npm install --global awsp
else
  echo "npm not found, skipping global npm packages" >&2
fi

curl -fsSL https://claude.ai/install.sh | bash

#
# oh-my-zsh. --unattended keeps it from running chsh and from exec'ing zsh,
# either of which would stop this script dead.
#
echo " -------- oh-my-zsh ----------"
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

clone_plugin() {
  local repo="$1" dest="${ZSH_CUSTOM}/plugins/$2"
  if [ -d "${dest}" ]; then
    echo "already present: $2"
  else
    git clone --depth 1 "${repo}" "${dest}"
  fi
}
clone_plugin https://github.com/zsh-users/zsh-autosuggestions zsh-autosuggestions
clone_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting
clone_plugin https://github.com/agkozak/zsh-z zsh-z
clone_plugin https://github.com/paulirish/git-open.git git-open

#
# Language runtimes.
#
echo " -------- runtimes -----------"
GO_VER=$(goenv install -l | tail -1 | sed 's/  //g')
goenv install -f "${GO_VER}"
goenv global "${GO_VER}"

tfenv install latest

pyenv install -s 3.13.0
pyenv global 3.13.0
# pip3 install aws-mfa

#
# AWS CLI ships as a pkg rather than a formula.
#
echo " -------- AWS CLI ------------"
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "/tmp/AWSCLIV2.pkg"
sudo installer -pkg /tmp/AWSCLIV2.pkg -target /

# Argo CD needs a running cluster, so this is not part of an unattended run.
# Bring up a cluster first (e.g. `kind create cluster`), then:
# kubectl create namespace argocd
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

while true; do
  read -p 'Add "need license" apps? [Y/n]' Answer
  case $Answer in
  '' | [Yy]*)
    brew bundle --file="${SCRIPT_DIR}/Brewfile.license"
    break
    ;;
  [Nn]*)
    echo "Skip install"
    break
    ;;
  *)
    echo Please answer YES or NO.
    ;;
  esac
done
echo " ------------ END ------------"
