package Data::Dumper::Perltidy;

###############################################################################
#
# Data::Dumper::Perltidy - Stringify and pretty print Perl data structures.
#
# Copyright 2009, John McNamara.
#
# perltidy with standard settings.
#
# Documentation after __END__
#

use strict;

use Exporter;
use Data::Dumper ();
use Perl::Tidy;
use vars qw($VERSION @EXPORT @ISA);

our $VERSION = '0.01';
our @EXPORT  = ('Dumper');
@ISA = qw(Exporter);

###############################################################################
#
# Dumper()
#
# Overridden version of Data::Dumper::Dumper() with perltidy formatting.
#
sub Dumper {

    my $tidied;
    my $dumper = Data::Dumper::Dumper(@_);

    perltidy( source => \$dumper, destination => \$tidied );

    return $tidied;
}

1;

__END__

=pod

=head1 NAME

Data::Dumper::Perltidy - Stringify and pretty print Perl data structures.

=head1 SYNOPSIS

Use the C<Data::Dumper::Perltidy::Dumper()> function to stringify and pretty print a Perl data structure:

    use Data::Dumper::Perltidy;

    ...

    print Dumper $some_data_structure;

=head1 DESCRIPTION

C<Data::Dumper::Perltidy> encapsulates both C<Data::Dumper> and C<Perl::Tidy> to provide a function that stringifies a Perl data structure in a pretty printed format. See the documentation for  L<Data::Dumper> and L<Perl::Tidy> for further information.

Data::Dumper can be used for, among other things, stringifying complex Perl data structures into a format that is suitable for printing and debugging.

Perl::Tidy can be used to pretty print Perl code in a consistent and configurable manner.

Data::Dumper also provides a certain level of pretty printing via the C<$Data::Dumper::Indent> variable but it isn't quite as nice as the Perl::Tidy output.

Let's look at an example to see how this module can be used. Say you have a complex data structure that you wish to inspect. You can use the C<Data::Dumper::Perltidy::Dumper()> function as follows (note that the syntax is the same as Data::Dumper):

    #!/usr/bin/perl -w

    use strict;
    use Data::Dumper::Perltidy;

    my $data = [{ title => 'This is a test header' },{ data_range =>
               [ 0, 0, 3, 9 ] },{ format     => 'bold' }];

    print Dumper $data;

This would print out:

    $VAR1 = [
        { 'title'      => 'This is a test header' },
        { 'data_range' => [ 0, 0, 3, 9 ] },
        { 'format'     => 'bold' }
    ];

By comparison the standard C<Data::Dumper::Dumper()> output would be:

    $VAR1 = [
              {
                'title' => 'This is a test header'
              },
              {
                'data_range' => [
                                  0,
                                  0,
                                  3,
                                  9
                                ]
              },
              {
                'format' => 'bold'
              }
            ];

Which isn't too bad but if you are used to Perl::Tidy and the L<perltidy> utility you may prefer the C<Data::Dumper::Perltidy::Dumper()> output.

=head1 EXPORT

The only function exported by Data::Dumper::Perltidy is C<Dumper()> and it is exported automatically.

=head1 FUNCTIONS

=head2 Dumper()

The C<Dumper()> function takes a list of perl structures and returns a stringified and pretty printed form of the values in the list. The values will be named C<$VARn> in the output, where C<n> is a numeric suffix.

The Data::Dumper C<$Data::Dumper::> configuration variable can be used to influence the output where applicable. For further information see the L<Data::Dumper> documentation.

Note: unlike C<Data::Dumper::Dumper()> this function doesn't currently return a list of strings in a list context.

=head1 RATIONALE

I frequently found myself copying the output of C<Data::Dumper::Dumper()> into an editor so that I could run C<perltidy> on it. This module scratches that itch.

=head1 LIMITATIONS

This module doesn't attempt to implement all, or even most, of the functionality of C<Data::Dumper>. In addition, and possibly more regrettably, it doesn't give access to the huge array of configuration options within C<Perl::Tidy>.

Patches, with tests and documentation, are welcome.

I may also add an option to use L<Data::Dumper::Names> if available.

=head1 AUTHOR

John McNamara C<jmcnamara@cpan.org>

=head1 BUGS

Please report any bugs or feature requests to C<bug-data-dumper-perltidy at rt.cpan.org> or through the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Data-Dumper-Perltidy>.

The author/maintainer will be notified, and you'll be automatically notified in turn of progress on your bug.

Patches should be accompanied by tests and documentation. It isn't fair to do the fun part and leave the less-fun part to someone else. ;-)

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Data::Dumper::Perltidy

You can also look for further information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Data-Dumper-Perltidy>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Data-Dumper-Perltidy>

=item * Search CPAN

L<http://search.cpan.org/dist/Data-Dumper-Perltidy/>

=back

You can even email the author if you wish.

=head1 ACKNOWLEDGEMENTS

The authors and maintainers of Data::Dumper and Perl::Tidy.

The structure of this module was created using L<Module::Starter>.

=head1 COPYRIGHT & LICENSE

Copyright 2009 John McNamara, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
