#!/usr/bin/perl

use utf8;
use strict;
use warnings;
use open ":utf8";
use open ":std";
use feature qw( say switch );
use Data::Dumper;
use Time::StopWatch::Log;

my $watch = Time::StopWatch::Log->new;

$watch->store( "aaaa" );

sleep 1;

$watch->store( "bbb" );

foreach my $log_ref ( $watch->fetch_tidy ) {
    say join " - ", @{ $log_ref }{ qw( message time ) };
}

