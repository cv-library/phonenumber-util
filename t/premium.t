use strict;
use warnings;

use PhoneNumber::Util 'is_premium_number';
use Test::More;

# Britain's Got Talent
ok is_premium_number( GB => '0904 161 7111' );

# Childline
ok !is_premium_number( GB => '0800 1111' );

# Invalid
ok !is_premium_number( GB => 'foo' );

done_testing;
