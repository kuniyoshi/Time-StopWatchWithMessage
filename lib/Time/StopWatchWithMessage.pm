package Time::StopWatchWithMessage;

use strict;
use warnings;
use Time::HiRes qw/gettimeofday tv_interval/;

our $VERSION = '0.01';

sub new {
    my $class   = shift;
    my $message = shift || "Start watching.";
    my @logs;

    push @logs, { time => [ gettimeofday ], message => $message };

    return bless \@logs, $class;
}

sub store {
    my $self    = shift;
    my $message = shift; 

    push @{ $self }, { time => [ gettimeofday ], message => $message };

    return $self->[0];
}

sub fetch {
    my $self = shift;
    my @logs;

    my $previsous_ref = $self->[0];

    CALCULATE_TV_INTERVAL:
    foreach my $log_ref ( @{ $self } ) {
        push @logs, {
            time    => tv_interval( $log_ref->{time}, $previsous_ref->{time} ),
            message => $log_ref->{message},
        };
    }

    return wantarray ? @logs : \@logs;
}

1;
__END__
=head1 NAME

Time::StopWatchWithMessage - Calculate a interval between Previous and Current with a message.

=head1 SYNOPSIS

  use Time::StopWatchWithMessage;
  my $watch = Time::StopWatchWithMessage->new;

  sleep 1;

  $watch->store( "This may take one second." );

  do_something( );

  $watch->store( "do_something took: " );

  foreach my $log_ref ( $watch->fetch ) {
      say join " - ", @{ $log_ref }{ qw( message time ) };
  }

=head1 DESCRIPTION

You can use Time::StopWatch.  This module likes it.
This is used to record a message.

=head2 EXPORT

None.

=head2 METHODS

=over

=item store

Stores a array reference of gettimeofday and a message.

=item fetch

Returns a list, it includes array reference from gettimeofday
by Time::HiRes.

=item fetch_tidy

Returns a list, it includes array reference from tv_interval
by Time::HiRes.

=back

=head1 SEE ALSO

=over

=item Time::StopWatch

=back

=head1 AUTHOR

Kuniyoshi.Kouji, E<lt>kuniyoshi@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by Kuniyoshi.Kouji

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut

