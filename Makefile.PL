use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'Data::Dumper::Perltidy',
    AUTHOR        => 'John McNamara <jmcnamara@cpan.org>',
    VERSION_FROM  => 'lib/Data/Dumper/Perltidy.pm',
    ABSTRACT_FROM => 'lib/Data/Dumper/Perltidy.pm',
    ( $ExtUtils::MakeMaker::VERSION >= 6.3002
        ? ( 'LICENSE' => 'perl' )
        : () ),
    PL_FILES  => {},
    PREREQ_PM => {
        'Test::More'   => 0,
        'Data::Dumper' => 0,
        'Perl::Tidy'   => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES    => 'Data-Dumper-Perltidy-*' },
);
