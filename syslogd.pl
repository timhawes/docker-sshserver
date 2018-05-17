#!/usr/bin/perl -T

use strict;
use IO::Socket;

my $MAXLEN = 1524;

$| = 1;

unlink("/dev/log");
my $sock = IO::Socket::UNIX->new(Type => SOCK_DGRAM, Local => '/dev/log') || die("Socket: $@");

my $buf;
while (1) {
  $sock->recv($buf, $MAXLEN);
  print "$buf\n";
};
