#!/usr/bin/bash

set -e

RUN="bundle exec jekyll serve"

# Ensure ruby and node are present.
if ! command -v ruby &>/dev/null ; then
    echo "Please install ruby."
    exit 1;
fi

if ! command -v npm &>/dev/null ; then
    echo "Please install node."
    exit 1;
fi

install_dependencies() {
    npm install
    npm run build
    gem install jekyll bundler
    bundle install

    # Build.
    rake default
}

test_mode() {
    $RUN & local PID=$!

    local FAIL=true
    if rake test &>/dev/null ; then
        FAIL=false
        echo "Success!"
    fi

    kill -2 $PID
    if $FAIL ; then
        echo "Failed!"
        exit 1;
    fi
}

while getopts 'it' flag; do
  case $flag in
    i) # do not use cache - slower
        install_dependencies;;
    t) # test mode
        test_mode
        exit;;
    \?) echo "bash run.sh [options: -i|t]"
        echo "  -i  install dependencies (needed for first run)"
        echo "  -t  test"
        echo
  esac
done

$RUN
