#!/usr/bin/env bash
if (( UID != 0 )); then
  exec sudo -E "$0" ${1+"$@"}
fi

apt-get update

# Set up personalization
sudo -u ubuntu -i git clone https://github.com/thorerik/dotfiles
sudo -u ubuntu -i /home/ubuntu/dotfiles/install.sh
chsh -s /usr/bin/zsh ubuntu
