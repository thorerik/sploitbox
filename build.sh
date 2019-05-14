#!/usr/bin/env bash

packer build -force ./packer/image.json
vagrant box add --name ubuntu-i3 --provider virtualbox ./output-vagrant/package.box --force
