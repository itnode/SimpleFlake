use strict;
use warnings;

use SimpleFlake;
use Test::More;
use Benchmark;

my $t0 = Benchmark->new;

my $i = 10000;

for( 1 .. $i) {

    my $hex_flake = SimpleFlake->get_flake;
#    print $hex_flake."\n";
}


my $t1 = Benchmark->new;
my $td = timediff($t1, $t0);

ok( $td, "needed " . timestr($td) . ' for ' . $i . ' executions' );

done_testing;
