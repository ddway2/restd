package Restd::Server;

use strict;
use warnings;

use AnyEvent;
use AnyEvent::HTTP::Server;
use Data::Dumper;
use EV;

use Moose;
use namespace::autoclean;

has 'httpd' => (
	is => 'rw' 
);
has 'host' => ( 
	isa => 'Str',
	is => 'rw',
	default => "0.0.0.0" 
);
has 'port' => (
	isa => 'Num', 
	is => 'rw',
	default => sub { 8080 }
);


sub BUILD {
	my $self = shift;

	$self->httpd(
		AnyEvent::HTTP::Server->new(
			host => $self->host(),
			port => $self->port(),
			cb => sub { $self->request(@_); }
		)
	);
}

sub request {
	my $self = shift;
	my $req = shift;

	

	$req->reply(
		200,
		"prout",
		headers => {'content-type' => 'text/html'}
	);
}

sub run {
	my $self = shift;

	print "Start Server\n";
	my ($h, $p) = $self->httpd->listen;
	$self->httpd->accept;

	warn "Server start at http://$h:$p";
	EV::loop;
}

__PACKAGE__->meta->make_immutable;

1;
