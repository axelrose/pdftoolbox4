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
x3suffix => '.pdf',
txtreportsuffix => '_report.html',
# reportstyletxt => 'XML,ALWAYS',
}

