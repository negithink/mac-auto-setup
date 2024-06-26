#!/bin/bash

# add to .git/hooks/pre-push below.
# ~/Repository/mac-auto-setup/git-push-ignore-main-branch.sh

readonly REJECT_PUSH_BRANCHES=('master' 'develop' 'main') 

while read local_ref local_sha1 remote_ref remote_sha1
do
    for branch in ${REJECT_PUSH_BRANCHES[@]}; do
        if [[ "${remote_ref##refs/heads/}" = "${branch}" ]]; then
            echo -e "\033[0;32mDo not push to\033[m\033[1;34m ${branch}\033[m \033[0;32mbranch\033[m" 1>&2
            exit 1
        fi
    done
done
