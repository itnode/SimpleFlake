use strict;
use warnings;

use SimpleFlake;
use Test::More;

my $random = SimpleFlake->get_random_bits(3);

$random = sprintf('%b', $random);

print $random."\n\n";
print length( $random)."\n\n";

#ok( length $random  == 23, "Random Bytes $random length is 23" );

my $timestamp = SimpleFlake->get_millisecond_timestamp;

$timestamp = sprintf('%b', $timestamp);

print $timestamp."\n\n";
print length( $timestamp)."\n\n";

#ok( length $timestamp == 41 , "Timestamp " . $timestamp . " length is 41" );

my $flake = SimpleFlake->get_flake($timestamp, $random, 1);

print $flake."\n";
print length ($flake)."\n\n";

ok ($flake, 'get rid of errors');

done_testing;
