package Restd::Scan::Path;

use strict;
use warnings;

use Data::Dumper;
use File::Path;
use File::Find;
use File::Spec;

use Moose;
use namespace::autoclean;

has 'router_re' => (
	is => 'rw'
);
has 'method' => (
	is => 'rw',
	isa => 'Str'
);
has 'content_type' => (
	is => 'rw',
	isa => 'Str'
);

sub BUILD {
	my $self = shift;
}

__PACKAGE__->meta->make_immutable;

1;