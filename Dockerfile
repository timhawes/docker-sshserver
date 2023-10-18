FROM debian:12

RUN apt-get update \
    && apt-get install -y \
        openssh-server ssh-import-id \
    && rm -r /var/lib/apt/lists/*
COPY syslogd.py /usr/local/sbin/syslogd.py
COPY entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
EXPOSE 22
VOLUME /home
