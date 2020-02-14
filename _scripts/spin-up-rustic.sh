#!/usr/bin/env bash
set -e

################
# Uncomment if you want the script to always use the scripts
# directory as the folder to look through
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

declare -a REPOSITORIES=(
"../rustic-auth"
"../rustic-locations"
"../rustic-ui"
"../rustic-users")

IFS=$'\n'

for i in "$@"; do
    if [ "$i" = "build" ]; then
        for REPO in "${REPOSITORIES[@]}"
        do
          if [ -d "${REPO%%:*}" ]
          then
            echo "Deploying ${REPO%%:*} to local registry at `date`"
            if [ -e "${REPO%%:*}/_scripts/docker/deploy-local-reg.sh" ]
            then
              cd "${REPO%%:*}"
              echo $PWD
              ls
              sh "_scripts/build.sh"
              sh "_scripts/docker/deploy-local-reg.sh"
            else
              echo "Skipping because it doesn't look like it has a deploy-local-reg bash script."
            fi
            echo "Done at `date`"
            echo
          fi
        done
    fi

    if [ "$i" = "spin" ]; then
        cd $DIR
        ls
        sh ./deploy-kube-deployments.sh
        sh ./deploy-kube-services.sh
        sh ./deploy-kube-ingresses.sh
    fi
done
