package PhoneNumber::Util 0.001;

use strict;
use warnings;

use XSLoader;

XSLoader::load();

sub import {
    no strict 'refs';

    *{ caller . '::is_phone_number'   } = \&is_phone_number;
    *{ caller . '::is_premium_number' } = \&is_premium_number;
}

1;
