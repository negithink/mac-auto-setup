#!/bin/bash
cat <<EOS

 AkkeyLab

 The elapsed time does not matter.
 Because speed is important.

EOS

#
# Mac App Store apps install
#
echo " ---- Mac App Store apps -----"
brew install mas
# mas install 425424353 # The Unarchiver (3.11.1)
# mas install 539883307 # LINE (6.3.2)
# mas install 425264550 # Disk Speed Test (3.2)
# mas install 409183694 # Keynote (10.2)
# mas install 441258766  # Magnet (2.4.9)
mas install 973213640  # MSG Viewer for Outlook (3.99.2)
mas install 973134470  # Be Focused (2.0.2)
mas install 1153157709 # Speedtest (1.18)
mas install 497799835  # Xcode (12.0.1)
# mas install 736189492  # Notability (4.4.1)
# mas install 409201541 # Pages (7.3)
# mas install 1295203466 # Microsoft Remote Desktop (10.4.1)
# mas install 803453959  # Slack (4.10.3)
# mas install 747648890  # Telegram (8.3)
# mas install 1295203466 # Microsoft Remote Desktop (10.7.3)
# mas install 946798523  # Sleep Control Center (2.19)
mas install 1548099536 # WattageViewer (1.3.2)
mas install 1291898086 # Toggl Track: Hours & Time Log (10.4.0)

echo " ------------ END ------------"
