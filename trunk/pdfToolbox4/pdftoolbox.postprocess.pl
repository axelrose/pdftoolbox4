#!/usr/bin/perl -w
use strict;
use Getopt::Std;

my $Id = '$Id: pdfcheck.postprocess.pl 5 2007-04-05 15:46:34Z axel.roeslein $';

chomp( my $heliosdir = do { local( @ARGV, $_ ) = "/etc/HELIOSInstallPath"; <> } );
die "FATAL - heliosdir '$heliosdir' does not exist\n" unless -d $heliosdir;

my %opts;
getopts( 'f:c:q:u:', \%opts );
my( $file, $copyfile, $queue, $user ) = ($opts{f}, $opts{c}, $opts{q}, $opts{u});

usage() unless $file;
die "FATAL - file '$file' not a readable file\n" unless -r $file;

sub usage {	warn "Usage: $0 -f <finalpdf> [-c <copyfile>] [-u <user>] [-q <queue>]\n" }

# invent your own procedure here

my $dt = $heliosdir . "/bin/dt";

system( $dt, "chmod", "777", $file );

__END__

=head1 VERSIONS

	$Id: pdfcheck.postprocess.pl 5 2007-04-05 15:46:34Z axel.roeslein $

=cut


