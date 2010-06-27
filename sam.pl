#!/usr/bin/perl

use utf8;
use strict;
use warnings;
use open ":utf8";
use open ":std";
use feature qw( say switch );
use Data::Dumper;
use Time::StopWatchWithMessage;
use Time::HiRes qw( sleep );

open my $FH, ">res.out"
    or die $!;

my $watch = Time::StopWatchWithMessage->new;

$watch->start;

sleep rand;

$watch->stop->start( "some" );

$watch->stop;

$watch->output( $FH );

close $FH
    or die $!;
