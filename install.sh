#!/bin/bash

ONP_STORE="$HOME/.otp"

if ! hash git 2>/dev/null; then
  echo >&2 "You need to install git - visit http://git-scm.com/downloads"
  exit 1
fi

echo
echo "-----------------"
echo "One True Password"
echo "-----------------"
echo

if [ -d "$LNK_DIR" ]; then
  echo "One True Password is already installed in $LNK_DIR, trying to update it"
  cd $LNK_DIR && git pull >/dev/null
  echo "Success: One True Password is up to date"
else
  echo "Installation in progress"
  echo "..."
  git clone https://github.com/jkbockstael/onetruepassword.git $LNK_DIR >/dev/null
  echo "Success: One True Password is installed!"
  echo
  echo "Please add those sentence in your .bashrc or .zshrc to use it."
  echo "-------------------------------------------------------------------------"
  echo "[ -s \$HOME/.otp/onetruepassword.sh ] && . \$HOME/.otp/onetruepassword.sh"
  echo "-------------------------------------------------------------------------"
fi