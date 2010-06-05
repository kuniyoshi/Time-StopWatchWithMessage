package Time::StopWatch::Log;

use strict;
use warnings;

require Exporter;
use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
) ] );
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );
our @EXPORT = qw(
);

our $VERSION = '0.01';


1;
__END__
=head1 NAME

Time::StopWatch::Log - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Time::StopWatch::Log;
  my $watch = Time::StopWatch;

=head1 DESCRIPTION

Blah blah blah.

=head2 EXPORT

None by default.

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

