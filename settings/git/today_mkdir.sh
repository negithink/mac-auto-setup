#/bin/zsh
#実行日の日付のディレクトリとnote.mdを作るshellscript

cd `dirname $0`
pwd
mkdir `date "+%Y-%m-%d"`
touch ./$(date "+%Y-%m-%d")/note.md
code -r ./$(date "+%Y-%m-%d")/note.md