#!/bin/sh

/usr/local/sbin/syslogd.py >/proc/1/fd/1 & 

if [ -n "$CRYPTED_ROOT_PASSWORD" ]; then
  usermod -p "$CRYPTED_ROOT_PASSWORD" root
fi

if [ -n "$EXTRA_PACKAGES" ]; then
  apt-get update
  apt-get install -y --no-install-recommends $EXTRA_PACKAGES
fi

if [ -n "$SSH_GITHUB_USER" ]; then
  useradd -s /bin/bash -m $SSH_GITHUB_USER
  su -c "ssh-import-id-gh $SSH_GITHUB_USER" $SSH_GITHUB_USER
fi

mkdir -p /run/sshd
/usr/sbin/sshd -D
