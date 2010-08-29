package Time::StopWatchWithMessage;

use strict;
use warnings;
use Time::HiRes qw( gettimeofday  tv_interval );

our $VERSION = '0.02';

sub new {
    my $class = shift;

    return bless [ ], $class;
}

sub start {
    my $self    = shift;
    my $message = shift || __PACKAGE__ . ">>> Start watching.";

    push @{ $self }, { time => [ gettimeofday ], message => $message };

    return $self;
}

sub stop {
    my $self = shift;
    my $time = [ gettimeofday ];

    my $previous = pop @{ $self };
    $previous->{time} = tv_interval( $previous->{time}, $time );

    push @{ $self }, $previous;

    return $self;
}

sub _output {
    my $self = shift;
    my $FH   = shift;

    require List::Util;

    my $sum = List::Util::sum( map { $_->{time} } @{ $self } );

    OUTPUT_ALL_WATCHES:
    while ( defined ( my $watch_ref = shift @{ $self } ) ) {
        my $output = sprintf "%s - %f/%f = %f[%%]\n",
            $watch_ref->{message},
            $watch_ref->{time},
            $sum,
            $watch_ref->{time} / $sum * 100;

        print { $FH } $output;
    }

    return;
}

sub output {
    my $self = shift;
    my $FH   = shift || *STDERR;

    return $self->_output( $FH );
}

sub print {
    my $self = shift;

    return $self->_output( *STDOUT );
}

sub warn {
    my $self = shift;

    return $self->_output( *STDERR );
}

1;

__END__
=encoding utf8

=head1 NAME

Time::StopWatchWithMessage - Calculate a interval between Previous and Current with a message.

=head1 SYNOPSIS

  use Time::StopWatchWithMessage;
  my $watch = Time::StopWatchWithMessage->new;

  $watch->start( "Initialize." );
  do_initialize( );
  $watch->stop;

  $watch->start( "Doing something." );
  do_something( );
  $watch->stop->start( "Finalize." );
  do_finalize( );
  $watch->stop;

  $watch->warn;

=head1 DESCRIPTION

You can use Time::StopWatch.  This module likes it.
This is used to record a message.

Note, this module hasn't care overhead of self executing.

=head2 EXPORT

None.

=head2 METHODS

=over

=item start

Starts watching time.

=item stop

Stops watching time.

=item warn

Prints the result to STDERR.

=item print

Prints the result to STDOUT.

=item output

Prints the result to file handle.

=back

=head1 SEE ALSO

=over

=item Time::StopWatch

=item Devel::Profile

=back

=head1 AUTHOR

Kuniyoshi.Kouji, E<lt>kuniyoshi@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by Kuniyoshi.Kouji

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut

