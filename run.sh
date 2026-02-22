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

function install_dependencies() {
    npm install
    npm run build
    gem install jekyll bundler
    bundle install
}

function download_assets() {
    cd "$1" || exit 1
    
    for item in * ; do
        if [ -f "${item}" ] && [ "${item}" == "$2" ]; then
            if command -v wget &> /dev/null ; then
                wget -i "$2"
            else
                while read url; do
                    curl -O "$url"
                done < "$2"
            fi
                
        fi
        
        if [ -d "${item}" ] ; then
            download_assets "${item}" "$2"
        fi
    done
    
    cd -
}

function build_mode() {
    # Build.
    rake sass
    rake default
}

function test_mode() {
    $RUN & local PID=$!

    local FAIL=true
    if rake test &>/dev/null ; then
        FAIL=false
        echo "Success!"
    fi

    kill -9 $PID
    if $FAIL ; then
        echo "Failed!"
        exit 1;
    fi
}

while getopts 'icbt' flag; do
  case $flag in
    i) # do not use cache - slower
        install_dependencies;;
    c) # download assets
        download_assets assets cdn.txt;;
    b) # build the site
        build_mode;;
    t) # test mode
        test_mode
        exit;;
    \?) echo "bash run.sh [options: -i|b|t]"
        echo "  -i  install dependencies (needed for first run)"
        echo "  -c  download assets from content delivery network"
        echo "  -t  test"
        echo "  -b  build"
        echo
        exit;;
  esac
done
