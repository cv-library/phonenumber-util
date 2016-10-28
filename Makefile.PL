use ExtUtils::MakeMaker;

WriteMakefile(
    CC           => 'g++',
    LIBS         => ['-lphonenumber'],
    NAME         => 'PhoneNumber::Util',
    VERSION_FROM => 'lib/PhoneNumber/Util.pm',
);
