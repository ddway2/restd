package Restd::Scan::Manager;

use strict;
use warnings;

use Data::Dumper;
use File::Path;
use File::Find;

use Moose;
use namespace::autoclean;

extends 'Restd::Object';

has 'root_path' => (
	is => 'rw',
	isa => 'Str'
);

sub scan {
	my $self = shift;

	if (! -d $self->root_path()) {
		$self->log_die("Root path not found: ", $self->root_path());
	}


}

sub scan_directory {
	my $self = shift;
	my $dir = shift;

}


__PACKAGE__->meta->make_immutable;

1;