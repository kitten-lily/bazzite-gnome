#!/bin/bash

set -ouex pipefail

### Prepare for stuff that installs to /opt
mkdir -p /var/opt

### Install packages
dnf -y copr enable scottames/ghostty

dnf -y install \
    https://vencord.dev/download/vesktop/amd64/rpm \
    ghostty

dnf -y copr disable scottames/ghostty

### Move opt stuff
mv /var/opt /usr/share/factory/var/opt

### Enable services
systemctl enable podman.socket
systemctl enable podman-restart.service

dnf5 clean all
