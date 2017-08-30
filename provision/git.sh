#!/bin/bash

config_git()
{
  echo "Running GIT Global Config"

  # Config Username and Email
  git config --global user.name "${GIT_USERNAME}"
  git config --global user.email "${GIT_EMAIL}"

  # Add Git Aliases
  git config --global alias.l log
  git config --global alias.a add
  git config --global alias.ph push
  git config --global alias.pl pull
  git config --global alias.s status
  git config --global alias.b branch
  git config --global alias.co checkout
  git config --global alias.df diff
  git config --global alias.dt difftool
  git config --global alias.c commit
  git config --global alias.t tag
  git config --global alias.st stash
  git config --global alias.m merge
  git config --global alias.f fetch
  git config --global alias.tree "log --graph --decorate --oneline"
  git config --global alias.tc "rev-list -n 1"
}

config_git
