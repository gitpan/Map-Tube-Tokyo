use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;
use File::ShareDir::Install;

install_share dist => 'share';

WriteMakefile(
    NAME               => 'Map::Tube::Tokyo',
    AUTHOR             => q{Mohammad S Anwar <mohammad.anwar@yahoo.com>},
    VERSION_FROM       => 'lib/Map/Tube/Tokyo.pm',
    ABSTRACT_FROM      => 'lib/Map/Tube/Tokyo.pm',
    LICENSE            => 'artistic_2',
    PL_FILES           => {},
    MIN_PERL_VERSION   => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES   => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'Moo'              => 0,
        'namespace::clean' => 0,
        'File::Share'      => 0,
        'Map::Tube'        => '2.61',
        'File::ShareDir::Install' => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Map-Tube-Tokyo-*' },
    (eval { ExtUtils::MakeMaker->VERSION(6.46) } ? (META_MERGE => {
        'meta-spec' => { version => 2 },
        provides    => {
            'Map::Tube::Tokyo'
                => { file => 'lib/Map/Tube/Tokyo.pm',              version => '0.12' },
            'Map::Tube::Tokyo::Line::Asakusa'
                => { file => 'lib/Map/Tube/Tokyo/Line/Asakusa.pm', version => '0.12' },
            'Map::Tube::Tokyo::Line::Chiyoda'
                => { file => 'lib/Map/Tube/Tokyo/Line/Chiyoda.pm', version => '0.12' },
        },
        resources => {
            repository => {
                type => 'git',
                url  => 'https://github.com/Manwar/Map-Tube-Tokyo.git',
                web  => 'https://github.com/Manwar/Map-Tube-Tokyo',
            },
        }})
     : ()
    ),
);

package MY;
use File::ShareDir::Install 'postamble';
