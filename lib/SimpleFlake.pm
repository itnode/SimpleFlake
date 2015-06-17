package SimpleFlake;
use 5.008001;
use strict;
use warnings;

use Time::HiRes qw(time);
use Math::BigInt;
use Bytes::Random::Secure qw(
  random_bytes random_bytes_base64 random_bytes_hex
);

our $VERSION = "0.02";

sub get_random_bits {

    my ( $class, $length ) = @_;

    my $random = Bytes::Random::Secure->new(
        Bits => 64,
        NonBlocking => 1,
    );

    return Math::BigInt->from_bin( unpack( 'B*', $random->bytes(5) ) );
}

sub get_millisecond_timestamp {

    my $time = Math::BigInt->new(time * 100000);
    return $time;
}

sub get_flake {

    my $class = shift;

    my $self = {};
    bless $self, $class;

    my $timestamp = $self->get_millisecond_timestamp;
    my $random = $self->get_random_bits;

    my $flake = $timestamp->blsft(41);
    $flake->bior($random);

    return $flake->as_hex;
}


1;
__END__

=encoding utf-8

=head1 NAME

SimpleFlake - A perl implemantation of SimpleFlake. Inspired by https://github.com/SawdustSoftware/simpleflake

=head1 SYNOPSIS

    use SimpleFlake;

    my $hex_flake = SimpleFlake->get_flake;

=head1 DESCRIPTION

SimpleFlake is a unique ID Generation Module based on timestamp in milliseconds and a part of randomness

=head1 LICENSE

Copyright (C) Jens Gassmann - Software Entwicklung.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

=over

=item * Jens Gassmann E<lt>jg@itnode.deE<gt>

=item * Patrick Simon E<lt>ps@itnode.deE<gt>

=back

=cut

