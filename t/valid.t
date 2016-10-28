use strict;
use warnings;

use PhoneNumber::Util 'is_phone_number';
use Test::More;

for (
    [ GB => 'tel: 08001111' ],      # ChildLine
    [ GB => '0845 4647' ],          # NHS Direct in Wales
    [ GB => '0800 111 999' ],       # British Gas (Emergency)
    [ GB => '+44 113 298 0900' ],   # British Gas (Abroad)

    [ US => '   202-456-1111' ],    # The White House
    [ US => '+1 202-456-1111' ],    # The White House

    [ ZZ => '+1 202-456-1111' ],    # The White House
    [ ZZ => '+44 113 298 0900' ],   # British Gas (Abroad)
) {
    my ( $country, $number ) = @$_;

    ok is_phone_number( $country, $number ),
        "is_phone_number $country => '$number'";
}

done_testing;
