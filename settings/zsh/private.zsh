export ZSH_DISABLE_COMPFIX=true

# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZDOTDIR=$HOME

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
DEFAULT_USER=""

SAVEHIST=100000

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
)

source $ZSH/oh-my-zsh.sh

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# User configuration
alias vlc='open -n /Applications/VLC.app'

# work alias
work_dir="~/Repository/work-note"
alias wn_cd_today='cd ~/Repository/'$work_dir'/$(date "+%Y-%m-%d")'
alias wn_cd_yesterday='cd ~/Repository/'$work_dir'/'$(date -v-1d "+%Y-%m-%d")
alias wn_cd_yesterday_print_date='cd ~/Repository/'$work_dir'/'$(date -v-1d "+%Y-%m-%d")
alias wn_mkdir_today='~/Repository/'$work_dir'/today_mkdir.sh'

# tools
alias rmlf='tr -d "\n"'
alias ecr_login='aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 016810206854.dkr.ecr.ap-northeast-1.amazonaws.com'

# tmux
alias tmux_detached_killall='tmux ls -F "#{session_name}:#{session_attached}" | awk -F: "/0\$/ {print \$1}" | xargs -I {} tmux kill-session -t {}'

# homebrew setting
export HOMEBREW_NO_INSTALL_CLEANUP=1

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

function fzf-history-widget() {
  local tac=${commands[tac]:-"tail -r"}
  BUFFER=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | sed 's/ *[0-9]* *//' | eval $tac | awk '!a[$0]++' | fzf +s)
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget

# gcp
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# AWS
export AWS_PAGER=""

# drawio
alias draw.io=/Applications/draw.io.app/Contents/MacOS/draw.io
alias drawio-png='draw.io -s 2 -xrf png -o ./ ./*.drawio;open .'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# jqdiff
jqdiff() {
  local source_file dest_file
  source_file="$1"
  dest_file="$2"
  diff <(jq --sort-keys . "$source_file") <(jq --sort-keys . "$dest_file")
}

# jqdiff
yqdiff() {
  local source_file dest_file
  source_file="$1"
  dest_file="$2"
  diff <(yq 'sort_keys(.)' "$source_file") <(yq 'sort_keys(.)' "$dest_file")
}

# rbenv
# export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Github Copilot in the CLI
ai() {
  gh copilot suggest -t shell "$*"
  # copilot suggest -t shell "$@" | tail -n +9
}

aigh() {
  gh copilot suggest -t gh "$*"
}

# Github Action
alias act='act --container-architecture linux/amd64'

# gdate
# alias date='gdate'

# fd - cd to selected directory
# https://qiita.com/kamykn/items/aa9920f07487559c0c7e
fcd() {
  local dir
  # 隠しファイルも含む
  #  dir=$(find ${1:-.} -path '*/\.*' -prune \
  dir=$(find ${1:-.} -path '*/\*' -prune \
    -o -type d -print 2>/dev/null | fzf +m) &&
    cd "$dir"
}

# fvim: ファイル名検索+Vimで開くファイルをカレントディレクトリからfzfで検索可能に
# ref: https://momozo.tech/2021/03/10/fzf%E3%81%A7zsh%E3%82%BF%E3%83%BC%E3%83%9F%E3%83%8A%E3%83%AB%E4%BD%9C%E6%A5%AD%E3%82%92%E5%8A%B9%E7%8E%87%E5%8C%96/
fvim() {
  local file
  file=$(
    rg --files --hidden --follow --glob "!**/.git/*" | fzf \
      --preview 'bat  --color=always --style=header,grid {}' --preview-window=right:60%
  )
  vi "$file"
}
alias fv="fvim"

# かつていたことのあるディレクトリに移動する
# https://qiita.com/kamykn/items/aa9920f07487559c0c7e
fzf-z-search() {
  local res=$(z | sort -rn | cut -c 12- | fzf)
  if [ -n "$res" ]; then
    BUFFER+="cd $res"
    zle accept-line
  else
    return 1
  fi
}

zle -N fzf-z-search
bindkey '^z' fzf-z-search

# プロセスをkill
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}

# fzfでdockerコンテナに入る
# ref: https://momozo.tech/2021/03/10/fzf%E3%81%A7zsh%E3%82%BF%E3%83%BC%E3%83%9F%E3%83%8A%E3%83%AB%E4%BD%9C%E6%A5%AD%E3%82%92%E5%8A%B9%E7%8E%87%E5%8C%96/
fdcnte() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')
  [ -n "$cid" ] && docker exec -it "$cid" /bin/bash
}

# fgc (git checkout) - checkout git branch including remote branches
# ref: https://qiita.com/kamykn/items/aa9920f07487559c0c7e
fgc() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" |
      fzf-tmux -d $((2 + $(wc -l <<<"$branches"))) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# flog - git commit browser
# ref: https://qiita.com/kamykn/items/aa9920f07487559c0c7e
flog() {
  git log --graph --color=always \
    --format="%C(auto)%h%d %s %C(#C0C0C0)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
              (grep -o '[a-f0-9]\{7\}' | head -1 |
              xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
              {}
              FZF-EOF
             "
}

# fadd: git add / diff をインタラクティブに．Ctrl-d で diff, Enter で add
# https://qiita.com/reviry/items/e798da034955c2af84c5
fadd() {
  local out q n addfiles
  while out=$(
    git status --short |
      awk '{if (substr($0,2,1) !~ / /) print $2}' |
      fzf-tmux --multi --exit-0 --expect=ctrl-d
  ); do
    q=$(head -1 <<<"$out")
    n=$(($(wc -l <<<"$out") - 1))
    addfiles=($(echo $(tail "-$n" <<<"$out")))
    [[ -z "$addfiles" ]] && continue
    if [ "$q" = ctrl-d ]; then
      git diff --color=always $addfiles | less -R
    else
      git add $addfiles
    fi
  done
}

# zplug
# export ZPLUG_HOME=/opt/homebrew/opt/zplug
# source $ZPLUG_HOME/init.zsh

# go
. "$HOME/.cargo/env"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/Cellar/tfenv/3.0.0/versions/1.6.2/terraform terraform

# direnv
export EDITOR=vim
eval "$(direnv hook zsh)"
export DIRENV_LOG_FORMAT=""

# less syntax higilighting
LESSPIPE=$(which src-hilite-lesspipe.sh)
export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R -X -F '
