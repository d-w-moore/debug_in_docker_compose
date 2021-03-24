#!/bin/bash -e
cd "$(dirname "$0")"
[ -f ssh_keys/id_rsa -a -f ssh_keys/id_rsa.pub ] || {
  rm -f ssh_keys/id_rsa*
  ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -P "" -f ssh_keys/id_rsa
}

#-------------------------

wget https://raw.githubusercontent.com/eficode/wait-for/dc067604c040715013f1abbaeccd0d27f4d379d6/wait-for
