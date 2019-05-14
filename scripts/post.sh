#!/usr/bin/env bash
if (( UID != 0 )); then
  exec sudo -E "$0" ${1+"$@"}
fi

apt-get update

# Set up personalization
rm -rf /home/ubuntu/.zgen
if [ -e /home/ubuntu/dotfiles ]; then
  sudo -u ubuntu -i sh -c "cd /home/ubuntu/dotfiles && git pull"
  sudo -u ubuntu -i /home/ubuntu/dotfiles/install.sh
else
  sudo -u ubuntu -i git clone https://github.com/thorerik/dotfiles
  sudo -u ubuntu -i /home/ubuntu/dotfiles/install.sh
fi
chsh -s /usr/bin/zsh ubuntu
