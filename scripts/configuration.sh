#!/usr/bin/env bash
set -e

# Relaunch as root if not already root
if (( UID != 0 )); then
  exec sudo -E "$0" ${1+"$@"}
fi

apt-get update
apt-get upgrade

apt-get install -y \
  git \
  zsh \
  python2.7 \
  python-pip \
  python-dev \
  libssl-dev \
  libffi-dev \
  build-essential \
  unzip \
  ansible \
  tmux \
  htop \
  openjdk-11-jdk \
  i3 \
  xubuntu-desktop \
  lightdm \
  libpam-kwallet4 \
  libpam-kwallet5 \
  virtualbox-guest-x11

# Configure system
systemctl enable lightdm
cat << EOF >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
[SeatDefaults]
greeter-session=unity-greeter
#user-session=i3
allow-guest=false
autologin-user=ubuntu
autologin-user-timeout=0
EOF


# Install toolkits
## Pwntools CTF toolkit
pip install --upgrade pwntools

## Ghidra
wget -O /tmp/ghidra.zip https://ghidra-sre.org/ghidra_9.0.2_PUBLIC_20190403.zip
mkdir -p /opt/ghidra
unzip /tmp/ghidra.zip
mv ghidra*/* /opt/ghidra/

### Install Ghidra menu item
cat << EOF > /usr/share/applications/ghidra.desktop
[Desktop Entry]
Version=9.0.2
Type=Application
Name=Ghidra
Exec=/opt/ghidra/ghidraRun
Icon=/opt/ghidra/docs/images/GHIDRA_1.png
Categories=Utility; 
EOF


## Metasploit
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall 
chmod 755 msfinstall 
./msfinstall

exit 0
