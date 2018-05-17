#!/bin/sh

/usr/local/sbin/syslogd.pl >/proc/1/fd/1 & 

if [ -n "$SSH_GITHUB_USER" ]; then
  useradd -s /bin/bash -m $SSH_GITHUB_USER
  su -c "ssh-import-id-gh $SSH_GITHUB_USER" $SSH_GITHUB_USER
fi

mkdir -p /run/sshd
/usr/sbin/sshd -D
