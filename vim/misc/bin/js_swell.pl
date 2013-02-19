#! /usr/bin/env perl

use strict;
use warnings;

use JavaScript::Swell;

my $data;
while (<>) {
    $data .= $_;
}

print JavaScript::Swell->swell($data);

1;

__END__

