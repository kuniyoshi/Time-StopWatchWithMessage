#!/usr/bin/perl
use 5.10.0;
use utf8;
use strict;
use warnings;
use open qw( :utf8 :std );
use Readonly qw( Readonly );
use Data::Dumper qw( Dumper );
use Time::HiRes qw( sleep );
use lib "lib";
use Time::StopWatchWithMessage;

Readonly my $COUNT => 10;

my $watch = Time::StopWatchWithMessage->new;

foreach my $index ( 1 .. $COUNT ) {
    $watch->start( "run $index times." );
    sleep rand;
    $watch->stop;
}

$watch->warn;

