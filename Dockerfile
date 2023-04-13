FROM debian:11

RUN apt-get update \
    && apt-get install -y \
        openssh-server ssh-import-id perl \
    && rm -r /var/lib/apt/lists/*
COPY syslogd.pl /usr/local/sbin/syslogd.pl
COPY entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
EXPOSE 22
VOLUME /home
