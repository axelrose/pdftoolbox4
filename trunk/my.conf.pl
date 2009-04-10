# pdfcheck.conf.pl
#
# configuration file for pdfcheck.p



# never delete this curly brace, file must have valid Perl syntax (check with "perl -c pdfceck.conf.pl")
{
ok => 'Bereinigt',
warning => 'Fehler',
error => 'Fehler',
copy => '',
insubdir => 1,
convsuffix => '_report.html',
txtreportsuffix => '_report.html',
reportstyletxt => 'XSLT=/Applications/callas\ pdfToolbox\ Server\ 4/cli/var/Reports/XSLT/compacthtml.xslt',
reportstylepdf => 'LAYER',
debug => 1
}

