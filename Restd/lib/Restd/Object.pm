package Restd::Object;

use strict;
use warnings;

$|++;

use Moose;
use namespace::autoclean;

our $Printer;

sub _print {
	my $self = shift;
	my $what = shift;

	chomp $what;

	if ($Printer) {
		$Printer->($what) unless $ENV{HARNESS_ACTIVE};
	} elsif ($ENV{HARNESS_ACTIVE}) {
		print $what, "\n" if ($ENV{HARNESS_VERBOSE});
	} else {
		print STDERR $what, "\n";
	}
	return;
}

sub _log_message {
	my $self = shift;

	my $what = '[' . $$ . '] ';
	$what .= join('', @_);

	$self->_print($what);
}

sub log_message {
	my $self = shift;
	$self->_log_message("L: ", @_);
}

sub log_warning {
	my $self = shift;
	$self->_log_message("W: ", @_);
}

sub log_error {
	my $self = shift;
	$self->_log_message("E: ", @_);
}

sub log_die {
	my $self = shift;
	$self->_log_message("DIE: ", @_);
	die join('', @_);
}

1;