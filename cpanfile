requires 'perl', '5.008001';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

requires 'Bytes::Random::Secure';
requires 'Math::BigInt';
requires 'Time::HiRes';
