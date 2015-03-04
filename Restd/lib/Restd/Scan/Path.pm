package Restd::Scan::Path;

use strict;
use warnings;

use Data::Dumper;
use File::Path;
use File::Find;
use File::Spec;

use Moose;
use namespace::autoclean;

extends 'Restd::Object';

has 'path' => (
	is => 'rw',
	isa => 'Str'
);
has 'pattern' => (
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
has 'handle' => (
	is => 'rw'
);

sub BUILD {
	my $self = shift;

	$self->prepare($o->path());
}

sub prepare {
	my $self = shift;
	my $path = shift;

	my @dirs = File::Spec->splitdir($path);
	my $pattern = "";

	foreach my $d (@dirs) {
		if ($d ~= /__(\w+)__/) {

		} else {
			$pattern .= "";
		}
	}
}

sub eval {
	my $self = shift;
	my $path = shift;

	my $pattern = $o->pattern();
	my $result = 0;

	# Apply pattern
	if ($path =~ m/$pattern/g) {

	}

	return $result;
}

__PACKAGE__->meta->make_immutable;

1;