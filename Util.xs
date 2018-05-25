#define PERL_NO_GET_CONTEXT

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef Move
#undef New
#include "phonenumbers/phonenumberutil.h"

using namespace i18n::phonenumbers;

const PhoneNumberUtil& phone(*PhoneNumberUtil::GetInstance());

MODULE = PhoneNumber::Util PACKAGE = PhoneNumber::Util

PROTOTYPES: DISABLE

void
is_phone_number(country, number)
    PPCODE:
        PhoneNumber phoneNumber;

        PhoneNumberUtil::ErrorType err = phone.Parse(
            (char *)SvPV_nolen(ST(1)),
            (char *)SvPV_nolen(ST(0)),
            &phoneNumber
        );

        if ( err == PhoneNumberUtil::ErrorType::NO_PARSING_ERROR && phone.IsValidNumber(phoneNumber) )
            XSRETURN_YES;
        else
            XSRETURN_NO;
