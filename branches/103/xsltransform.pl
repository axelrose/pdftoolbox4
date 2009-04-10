#!/usr/bin/perl

use FindBin;

my $Id = '$Id: xsltransform.pl 6 2007-04-05 15:48:46Z axel.roeslein $';

my $file = shift || die "no input, no output";
my $lang = shift || "de"; # default language = de

my $xsl = $FindBin::Bin . '/xslt/compacthtml.xslt';
$xsl = $FindBin::Bin . '/xslt/compacthtml.xslt' if $lang eq "en";
die "not readable: '$xsl'" unless -r $xsl;

my $outfile = $file . '.1';

# xsltproc doesn't like % in filenames
$outfile =~ s/%/_/g;

my @cmd = ( "xsltproc", "-o", $outfile, $xsl, $file );
system @cmd and die "$0: system error ", $? >> 8, " running command:\n@cmd\n";

# DEBUG
# save a copy of XML and HTML files
# system( "cp", $file, "/tmp/" ) and warn $!;
# system( "cp", $outfile, "/tmp/" ) and warn $!;

system( "mv", $outfile, $file ) and die $!;

exit 0;


