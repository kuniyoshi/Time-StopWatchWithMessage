NAME
====

Time::StopWatchWithMessage - Calculate a interval between Previous and Current with a message

SYNOPSIS
========

    use Time::StopWatchWithMessage;
    $Time::StopWatchWithMessage::IS_REALTIME = 0;
    $Time::StopWatchWithMessage::LENGTH      = 3;

    my $watch = Time::StopWatchWithMessage->new;

    $watch->start( "Initialize." );
    do_initialize( );
    $watch->stop;

    $watch->start( "Doing something." );
    do_something( );
    $watch->stop->start( "Finalize." );
    do_finalize( );
    $watch->stop->warn;

DESCRIPTION
===========

You can use Time::StopWatch. This module likes it. This is used to
record a message.

Note, this module hasn't care overhead of self executing.

EXPORT
======

None.

GLOBALS
=======

$Time::StopWatchWithMessage::IS_REALTIME
----------------------------------------

Reports message per stop.

$Time::StopWatchWithMessage::LENGTH
-----------------------------------

Specifies a length of after floating point of the report.

METHODS
=======

start
-----

Starts watching time.

stop
----

Stops watching time.

collapse
--------

Collapses message which has same message.

This is useful when you call start, and stop in loop.

warn
----

Prints the result to STDERR.

print
-----

Prints the result to STDOUT.

output
------

Prints the result to file handle.

SEE ALSO
========

* Time::StopWatch
* Devel::Profile

AUTHOR
======

Kuniyoshi.Kouji, <kuniyoshi@cpan.org>

COPYRIGHT AND LICENSE
=====================

Copyright (C) 2010 by Kuniyoshi.Kouji

This library is free software; you can redistribute it and/or modify it
under the same terms as Perl itself, either Perl version 5.10.1 or, at
your option, any later version of Perl 5 you may have available.

