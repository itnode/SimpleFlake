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

sub get_random {

    my ( $self, $length ) = @_;

    return random_bytes_hex($length);
}

sub get_timestamp {

    return localtime(time);
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

