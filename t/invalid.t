use strict;
use warnings;

use PhoneNumber::Util 'is_phone_number';
use Test::More;

eval { is_phone_number('GB') };

is $@,
    'Usage: PhoneNumber::Util::is_phone_number(country, number) at '
    . __FILE__ . ' line ' . ( __LINE__ - 4 ) . ".\n",
    'Passing insufficient number of arguments dies';

{
    my $warn;
    local $SIG{__WARN__} = sub { $warn = $_[0] };

    is_phone_number GB => undef;

    is $warn,
        'Use of uninitialized value in subroutine entry at ' . __FILE__
        . ' line ' . ( __LINE__ - 4 ) . ".\n",
        'Passing undef warns';
}

for ( '', 'a', qr//, [], sub {}, \*STDOUT, {}, \my $foo ) {
    ok !is_phone_number( GB => $_ ), "is_phone_number GB => $_";
}

for (
    [ GB => '202-456-1111' ], # The White House
    [ US => '0845 4647' ],    # NHS Direct in Wales
) {
    my ( $country, $number ) = @$_;

    ok !is_phone_number( $country, $number ),
        "is_phone_number $country => '$number'";
}

done_testing;
