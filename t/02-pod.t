#!/usr/bin/perl -w

###############################################################################
#
# A test for Data::Dumper::Perltidy.
#
# Basic test for Pod correctness.
#
# reverse('©'), January 2009, John McNamara, jmcnamara@cpan.org
#

use strict;
use Test::More;

# Ensure a recent version of Test::Pod
my $min_tp = 1.22;

eval "use Test::Pod $min_tp";

plan skip_all => "Test::Pod $min_tp required for testing POD" if $@;

all_pod_files_ok();
