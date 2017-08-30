#!/bin/bash

# Update The OS
apt-get update \
  && apt-get install -y

apt-get install -y \
  ntp \
  git-core \
  git-flow

service ntp start

alias ll="ls -l"
