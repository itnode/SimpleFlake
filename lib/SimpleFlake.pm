package SimpleFlake;
use 5.008001;
use strict;
use warnings;

use DateTime;
use Bytes::Random::Secure qw(
    random_bytes random_bytes_base64 random_bytes_hex
);

our $VERSION = "0.01";

use constant SIMPLEFLAKE_TIMESTAMP_LENGTH => 41;
use constant SIMPLEFLAKE_RANDOM_LENGTH => 23;

use constant SIMPLEFLAKE_RANDOM_SHIFT => 0;
use constant SIMPLEFLAKE_TIMESTAMP_SHIFT => 23;

sub get_random {

    my ( $class, $length ) = @_;

    return random_bytes($length);
}

sub get_millisecond_timestamp {

    my $time = int(time) * 1000;
    return $time;
}

sub get_flake {

    my $class = shift;

    my $self = {};
    bless $self, $class;

    my $timestamp = $self->get_millisecond_timestamp;
    my $random = $self->get_random;

    use DDP;
    p $random;

    my $flake = ( $timestamp << SIMPLEFLAKE_TIMESTAMP_SHIFT ) + $random;

    return $flake;
}

sub as_hex {

    my ( $class, $flake ) = @_;

    return pack( 'b', $flake );
}

1;
__END__

=encoding utf-8

=head1 NAME

SimpleFlake - It's new $module

=head1 SYNOPSIS

    use SimpleFlake;

=head1 DESCRIPTION

SimpleFlake is ...

=head1 LICENSE

Copyright (C) Patrick Simon.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Patrick Simon E<lt>pas.freelance@googlemail.comE<gt>

=cut

