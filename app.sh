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
# brew cask install 1password
brew cask install android-file-transfer
brew cask install java
# brew cask install android-studio
# brew cask install arduino
brew cask install astropad
# brew cask install atom
# brew cask install cheatsheet
brew cask install cyberduck
brew cask install docker
# brew cask install dropbox
# brew cask install duet
# brew cask install eclipse-java
brew cask install google-chrome
brew cask install iterm2
# brew cask install sourcetree
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vlc
brew cask install google-japanese-ime
brew cask install swimat
# brew cask install spotify
# brew cask install imageoptim
# brew cask install soundflower
brew cask install visual-studio-code
# brew cask install adobe-creative-cloud
# brew cask install gyazo
brew cask install zoomus
# brew cask install tandem
brew cask install discord
brew cask install scroll-reverser # 動作未確認
brew tap homebrew/cask-drivers # 動作未確認
brew install logitech-control-center # 動作未確認
brew install pyenv
brew install nodebrew
brew cask install toggl-track 
brew cask install thunderbird

# For Work
brew cask install coolterm

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
      # brew cask install microsoft-office # install済み
      # brew cask install clip-studio-paint
      brew cask install intellij-idea
      brew cask install parallels
      brew cask install microsoft-teams
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

