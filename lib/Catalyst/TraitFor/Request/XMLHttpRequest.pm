package Catalyst::TraitFor::Request::XMLHttpRequest;

use Moose::Role;
use MooseX::Types::Moose qw(Bool);
use namespace::autoclean;

has is_xhr => (
    is      => 'ro',
    isa     => Bool,
    lazy    => 1,
    builder => '_build_is_xhr',
);

sub _build_is_xhr {
    my ($self) = @_;
    my $req_with = $self->header('X-Requested-With');

    return 0 unless defined $req_with;
    return 0 if $req_with ne 'XMLHttpRequest';
    return 1;
}

1;
