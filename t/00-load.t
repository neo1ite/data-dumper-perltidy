#!/usr/bin/perl -w

###############################################################################
#
# A test for Data::Dumper::Perltidy.
#
# Basic test to ensure the module loads.
#
# reverse('©'), January 2009, John McNamara, jmcnamara@cpan.org
#

use Test::More tests => 1;

BEGIN {
    use_ok('Data::Dumper::Perltidy');
}

__END__
