#!/bin/bash
cat <<EOS

 AkkeyLab

 The elapsed time does not matter.
 Because speed is important.

EOS

#
# Install web apps.
#
echo " ----- Install web apps ------"
# brew install --cask 1password
# brew install --cask android-file-transfer
brew install --cask java
# brew install --cask arduino
brew install --cask cyberduck
brew install --cask docker
# brew install --cask duet
# brew install --cask eclipse-java
brew install --cask google-chrome
brew install --cask iterm2
# brew install --cask sourcetree
brew install --cask vlc
brew install --cask google-japanese-ime
brew install --cask swimat
brew install --cask visual-studio-code
# brew install --cask gyazo
brew install --cask zoomus
# brew install --cask tandem
brew install --cask discord
brew install --cask scroll-reverser
brew tap homebrew/cask-drivers
brew install pyenv
brew install nodebrew
brew install tree
brew install --cask monitorcontrol
brew install --cask toggl-track
brew install --cask adobe-acrobat-reader
brew install --cask tableplus
npm install --global git-open
brew install --cask drawio
brew install git-remote-codecommit
npm install -g awsp
brew install --cask session-manager-plugin
brew install --cask clipy
brew install imagemagick
brew install peco # zsh
brew install --cask kindle
brew install --cask omnidisksweeper

# For Work
brew install mysql
# brew install sops
brew install --cask postman
# brew install --cask sfdx
brew tap heroku/brew
# brew install heroku
brew install postgresql
brew install --cask dbeaver-community
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
brew install jq
brew install gh
gh ext install meiji163/gh-notify
brew install hub
brew install --cask keycastr
brew install pass
brew install dmenu
brew install act
brew install actionlint
# brew install php-cs-fixer
# brew install librsvg
brew install plantuml
brew install source-highlight

# For CFn
brew install cfn-format
brew install ruby brew-gem
brew gem install cfn-nag

# Goenv
brew install goenv
GO_VER=$(goenv install -l | tail -1 | sed 's/  //g')
goenv install -f ${GO_VER}
goenv global ${GO_VER}

# terraform
brew install tfenv
tfenv install latest

# AWS-CLI
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "/tmp/AWSCLIV2.pkg"
sudo installer -pkg /tmp/AWSCLIV2.pkg -target /
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
pyenv install 3.9.0
pyenv global 3.9.0
pip3 install aws-mfa
brew install direnv
brew install amazon-ecs-cli

brew install fzf ripgrep bat

while true; do
  read -p 'Add "need license" apps? [Y/n]' Answer
  case $Answer in
  '' | [Yy]*)
    # brew install --cask microsoft-office # install済み
    # brew install --cask clip-studio-paint
    brew install --cask intellij-idea
    brew install --cask parallels
    brew install --cask microsoft-teams
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
