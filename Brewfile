# Brewfile -- declarative package list for mac-auto-setup.
#
# Applied with `brew bundle` from app.sh. Comment a line out to skip it;
# re-running is safe because brew bundle skips what is already installed.

# ---------------------------------------------------------------- taps ----
tap "carvel-dev/carvel"
tap "brew-gem/gems"

# ------------------------------------------------------------- web apps ---
# cask "1password"
# cask "android-file-transfer"
brew "openjdk" # https://zenn.dev/roronya/articles/20230213184800
# cask "arduino-ide" # the plain "arduino" cask was removed upstream
# cask "cyberduck"
cask "rancher"
brew "docker"
brew "docker-compose"
# cask "duet"
# cask "eclipse-java"
cask "google-chrome"
cask "iterm2"
# cask "sourcetree"
cask "vlc"
cask "google-japanese-ime"
# cask "swimat"
cask "visual-studio-code"
# cask "gyazo"
cask "zoom"
# cask "tandem"
cask "discord"
# cask "scroll-reverser"
cask "messenger" # facebook messenger
brew "pyenv"
brew "nodebrew"
brew "uv"
brew "tree"
# cask "monitorcontrol"
cask "adobe-acrobat-reader"
cask "tableplus"
brew "git-open"
cask "drawio"
brew "git-remote-codecommit"
cask "mysqlworkbench"
cask "session-manager-plugin"
cask "clipy"
brew "imagemagick"
brew "peco" # zsh
# cask "kindle" # removed upstream, no longer published by Amazon
cask "omnidisksweeper"
cask "windows-app"

# ------------------------------------------------------------- for work ---
brew "mysql"
cask "postman"
cask "dbeaver-community"

brew "jq"
brew "gh"
brew "hub"
brew "act"
brew "actionlint"
brew "plantuml"
cask "mosaic"
brew "watch"
brew "coreutils" # for gdate
cask "karabiner-elements"
cask "linearmouse"
cask "rectangle"

# ------------------------------------------------------------------ CFn ---
brew "cfn-format"
brew "cfn-lint"
brew "ruby"
brew "brew-gem" # cfn-nag is installed via `brew gem` in app.sh

# -------------------------------------------------------------- runtimes --
brew "goenv"
brew "tfenv"

# ------------------------------------------------------------------ k8s ---
brew "kubernetes-cli" # provides kubectl
brew "kustomize"
brew "helm"
brew "krew"
brew "kubectx"
brew "carvel-dev/carvel/vendir"
brew "argocd"
brew "kind"
krew "neat"
krew "view-secret"

# ------------------------------------------------------------------ AWS ---
cask "aws-vpn-client"
brew "direnv"
brew "amazon-ecs-cli"

brew "fzf"
brew "ripgrep"
brew "bat"

# --------------------------------------------- added after initial setup --
brew "awslogs"
brew "blueutil"
brew "conftest"
brew "ffmpeg"
brew "gcx"
brew "ghi"
brew "git"
brew "glab"
brew "gnupg"
brew "graphviz"
brew "jira-cli"
brew "kafka"
brew "kubecolor"
brew "lesspipe"
brew "macvim"
brew "mas"
brew "mysql-client"
brew "opa"
brew "openjdk@21"
brew "pandoc"
brew "rbenv"
brew "reattach-to-user-namespace"
brew "ruby-build"
brew "source-highlight"
brew "specify"
brew "tmux"
brew "vegeta"
brew "wget"
brew "yarn"
brew "yq"
brew "zsh"

cask "chatgpt"
cask "claude-code"
cask "codex-app"
cask "copilot-cli"
cask "corretto@17"
cask "deepl"
cask "displaylink"
cask "gcloud-cli" # supersedes the old google-cloud-sdk token
cask "miro"
# cask "pullbar" # removed upstream, no longer published

# Mac App Store apps live in Brewfile.appstore, applied by appstore.sh.
