package Restd::Scan::Manager;

use strict;
use warnings;

use Data::Dumper;

use Moose;
use namespace::autoclean;

has 'root_path' => (
	is => 'rw',
	isa => 'Str'
);




__PACKAGE__->meta->make_immutable;

1;