package Restd::Scan::Manager;

use strict;
use warnings;

use Data::Dumper;
use File::Path;
use File::Find;
use File::Spec;

use Moose;
use namespace::autoclean;

extends 'Restd::Object';

has 'root_path' => (
	is => 'rw',
	isa => 'Str'
);

has 'router_path_list' => (
	is => 'rw',
	isa => 'HashRef[Any]'
);

sub scan {
	my $self = shift;

	if (! -d $self->root_path()) {
		$self->log_die("Root path not found: ", $self->root_path());
	}

	# Scan Directory
	scan_directory();
}

sub scan_directory {
	my $self = shift;
	my $dir = shift || "";

	my $abs_dir = File::Spec->catfile($self->root_path(), $dir);

	# Get all files
	my @entries = glob($abs_dir);
	foreach my $e (@entries) {
		$self->process_file($e) if (-e $e);
		$self->scan_directory($e) if (-d $e);
	}
}

sub process_file {
	my $self = shift;
	my $file = shift;

	
	if (-x $file) {
		# Executable file

	} else {
		# Static file
	}
}


__PACKAGE__->meta->make_immutable;

1;