use strict;
use Test::More 0.98;

use SimpleFlake;

my $random = SimpleFlake->get_random(23);

ok( $random, "Random Bytes " . $random . " generated" );

done_testing;
