#!/usr/bin/env python3

import os
import socket
import sys

MAXLEN = 1524
PATH = "/dev/log"

try:
    os.unlink(PATH)
except FileNotFoundError:
    pass

with socket.socket(socket.AF_UNIX, socket.SOCK_DGRAM) as s:
    s.bind(PATH)
    while True:
        data = s.recv(MAXLEN)
        sys.stdout.buffer.write(data + b"\n")
        sys.stdout.buffer.flush()
