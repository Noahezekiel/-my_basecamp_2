#!/usr/bin/env bash
yarn install
yarn build:css
bundle exec rake assets:precompile
