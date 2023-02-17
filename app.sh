#!/bin/bash
cat << EOS

 AkkeyLab

 The elapsed time does not matter.
 Because speed is important.

EOS

#
# Install web apps.
#
echo " ----- Install web apps ------"
# brew install --cask 1password
brew install --cask android-file-transfer
brew install --cask java
# brew install --cask android-studio
# brew install --cask arduino
brew install --cask astropad
# brew install --cask atom
# brew install --cask cheatsheet
brew install --cask cyberduck
brew install --cask docker
# brew install --cask dropbox
# brew install --cask duet
# brew install --cask eclipse-java
brew install --cask google-chrome
brew install --cask iterm2
# brew install --cask sourcetree
brew install --cask virtualbox
brew install --cask virtualbox-extension-pack
brew install --cask vlc
brew install --cask google-japanese-ime
brew install --cask swimat
# brew install --cask spotify
# brew install --cask imageoptim
# brew install --cask soundflower
brew install --cask visual-studio-code
# brew install --cask adobe-creative-cloud
# brew install --cask gyazo
brew install --cask zoomus
# brew install --cask tandem
brew install --cask discord
brew install --cask scroll-reverser # 動作未確認
brew tap homebrew/cask-drivers # 動作未確認
brew install logitech-control-center # 動作未確認
brew install pyenv
brew install nodebrew
brew install tree
brew install --cask monitorcontrol
brew install --cask toggl-track 
brew install --cask thunderbird
brew install --cask adobe-acrobat-reader
brew install --cask tableplus
npm install --global git-open
brew install --cask drawio
brew install git-remote-codecommit
npm install -g awsp
brew install --cask clipy

# For Work
brew install --cask coolterm
brew install mysql
brew install sops
brew install --cask postman
brew install --cask sfdx
brew tap heroku/brew
brew install heroku
brew install postgresql
brew install goenv

# AWS-CLI
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "/tmp/AWSCLIV2.pkg"
sudo installer -pkg /tmp/AWSCLIV2.pkg -target /
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
pyenv install 3.9.0
pyenv global 3.9.0
pip3 install aws-mfa
brew install direnv

while true; do
  read -p 'Add "need license" apps? [Y/n]' Answer
  case $Answer in
    '' | [Yy]* )
      # brew install --cask microsoft-office # install済み
      # brew install --cask clip-studio-paint
      brew install --cask intellij-idea
      brew install --cask parallels
      brew install --cask microsoft-teams
      break;
      ;;
    [Nn]* )
      echo "Skip install"
      break;
      ;;
    * )
      echo Please answer YES or NO.
  esac
done;
echo " ------------ END ------------"

