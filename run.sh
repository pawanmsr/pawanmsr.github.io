#!/usr/bin/bash

set -e

npm run build
bundle exec jekyll serve
