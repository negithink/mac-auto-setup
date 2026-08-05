# mac-auto-setup
Auto setup system for macOS.

## macOS version
macOS Catalina 10.15.4

## Downloads
To get started please run:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/AkkeyLab/mac-auto-setup/master/download.sh)"
```

## Installation
To get started please run:
```
~/mac-auto-setup/setup.sh
```
Install GUI apps:
```
~/mac-auto-setup/app.sh
```
Install App Store apps:
```
~/mac-auto-setup/appstore.sh
```
Update apps and settings:
```
~/mac-auto-setup/update.sh
```

`app.sh` asks for the sudo password once up front and keeps the timestamp
alive, so the pkg-based casks do not stop to prompt for it again.

## Package list
Packages are declared in Brewfiles and applied with `brew bundle`, so both
scripts are safe to re-run: anything already installed is skipped.

| File | Applied by | Contents |
|:--|:--|:--|
|`Brewfile`|`app.sh`|taps, formulae, casks, krew plugins|
|`Brewfile.appstore`|`appstore.sh`|Mac App Store apps (via `mas`)|
|`Brewfile.license`|`app.sh` (on the `[Y/n]` prompt)|apps needing a paid licence|

To add or drop an app, edit the Brewfile rather than the script; commenting a
line out is enough to skip it. To capture what is currently on the machine:
```
brew bundle dump --force --describe
```

## Apps config file
| Apps | Config | Remarks |
|:----------:|:-----------|:-------------|
|Mail|`~/Library/Mail/V2`<br>`~/Library/Mail/V3`<br>`~/Library/Containers/com.apple.mail`|No save password|
|keychain Access|`~/Library/Keychains/*.keychain`<br>or iCloud|keychain password is login password|
|AddressBook|`~/Library/Application Support/AddressBook/*`<br>or iCloud|-|
|Cyberduck|`~/Library/Application Support/Cyberduck/*`|-|
|SourceTree|`~/Library/Application Support/SourceTree/*`|-|
|SSH|`~/.ssh/config`<br>`~/.ssh/[Key file]`|-|
|VMware Horizon View Client|`~/Library/Preferences/com.vmware.horizon.plist`|-|
|Xcode|`Preference > Fonts & Colors > Dusk`<br>`Preference > Accounts import *.developerprofile`|-|
|Slack|`~/Library/Containers/com.tinyspeck.slackmacgap/Data/Library/Application Support/Slack/storage/*`|-|

# License
mac-auto-setup is available under the MIT license. See the LICENSE file for more info.
