use strict;
use warnings;
use Time::StopWatchWithMessage;
use Test::More tests => 1;

my @methods = qw(
    new
    start  stop
    _output  output  print  warn
);

my $watch = Time::StopWatchWithMessage->new;

can_ok( $watch, @methods );

