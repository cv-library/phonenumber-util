FROM perl:5.26

RUN apt-get update \
 && apt-get install -y --no-install-recommends libphonenumber-dev

CMD perl Makefile.PL && make && prove -blv
