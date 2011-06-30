package DataFlow::Proc::YAML;

use strict;
use warnings;

# ABSTRACT: A YAML converting processor

# VERSION

use Moose;
extends 'DataFlow::Proc::Converter';

use namespace::autoclean;
use YAML::Any;

sub _policy {
    return shift->direction eq 'CONVERT_TO' ? 'ArrayRef' : 'Scalar';
}

sub _build_subs {
    my $self = shift;
    return {
        'CONVERT_TO' => sub {
            return Dump($_);
        },
        'CONVERT_FROM' => sub {
            return Load($_);
        },
    };
}

__PACKAGE__->meta->make_immutable;

1;

