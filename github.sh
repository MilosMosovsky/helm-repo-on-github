#!/usr/bin/env bash

set -eu

DESTINATION_DIR=./charts

usage() {
cat << EOF
GitHub repository integration with Helm.
This plugin provides a way how to release a Helm chart inside GH repository.

Available Commands:

  release     Release a packed chart to /charts folder and act as repository.

EOF
}

release() {
  echo "Releasing chart $1"
  helm package ./$1 --destination=$DESTINATION_DIR
  helm repo index $DESTINATION_DIR
  PARSED_VERSION=$(helm search $1 | awk '{print $2}')
  VERSION=$(echo $PARSED_VERSION | awk '{print $2}')

  git add .
  git commit -m "[Helm] Release chart $1-$VERSION "
  git push origin master
  echo "Successfully pushed $1 to GitHub"
}


if [[ $# < 2 ]]; then
  usage
  exit 1
fi

case "${1:-"help"}" in
  "release")
    release $2
    ;;
  "help")
    usage
    ;;
  *)
    usage
    exit 1
    ;;
esac
