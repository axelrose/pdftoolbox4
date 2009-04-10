# pdfcheck.conf.pl
#
# configuration file for pdfcheck.p



# never delete this curly brace, file must have valid Perl syntax (check with "perl -c pdfceck.conf.pl")
{
# your Helios installation is in:
#heliosdir => '/usr/local/helios',

# all work files go there, don't share this directory with Helios!
#tmpdir => '/tmp',

# choose binary for pdfInspektor
# standard with Helios installationis:
# pdfinsp => '/usr/local/helios/callas/pdfInspektor3',
# with a fresh callas version
#pdfinsp => '/Applications/pdfInspektor3_CLI/pdfInspektor3',
# with remote execution:
# pdfinsp => 'ssh fserver.sjintra.net \'/usr/local/pdfInspektor3_CLI/pdfInspektor3',

# don't show progress info, always overwrite (surrounding script has to take care)
pdfinspopt => '--ignorehash --noprogress --o',

# pdfInspektor report language
# Danish: da, German: de, English: en, French: fr, Italian: it, Netherlands: nl, Portuguese: pt, Svedish: sv
reportlang => 'de',

# start/end line of text reports in Helios log files
reporttxt0 => "------------- Start pdfInspector output -------------\n",
reporttxt1 => "-------------- End pdfInspector output --------------\n",

# PDF report
# choose from PDFCOMMENTS PDFMASK PDFLAYER
# choose from ALWAYS ONHIT ONERROR ONWARNING ONINFO ONNONE
# reportstylepdf => 'PDFCOMMENTS,ONHIT',
# or leave empty to skip PDF report
reportstylepdf => '',

# Text report
# examples:
# reportstyletxt => 'COMPACT,SHORT,UTF8,ALWAYS',
# see pdfInspektor manual or output from "pdfInspektor3 -h" for further report options
# or leave empty to skip text report
# reportstyletxt => '',
reportstyletxt => 'XML,SHORT,PAGEINFO,DOCRSRC',

# Text report might be patched with this script
# txtpatchscript => 'patch-txtreport.pl',
# or transformed to html
txtpatchscript => 'xsltransform.pl',
# or left untouched
# txtpatchscript => '',

# output directory for 0 errors, 0 warnings
# don't leave empty!
ok => 'OK',

# output directory for 0 errors, 1 or more warnings
# you may use the same directory as for "error"
# don't leave empty!
warning => 'Warnung',

# output directory for 1 or more errors
# you may use the same directory as for "warning"
# don't leave empty!
error => 'Fehler',

# copy original input files after processing to this directory
# may be left empty or identical to ok/warning/error directory
copy => '',

# 0: copy all input files to copy dir
# 1: don't copy
# default: 0
# has no effect is copy dir is not defined
# dontcopyerrors => 0,
dontcopyerrors => 1,

# 1: input directory is a subdirectory (DIR:IN, DIR:ERROR, DIR:OUT)
# 0: subdir is on top of output directories (DIR, DIR:ERROR, DIR:OUT)
insubdir => 0,

# effective only for notification script
# 1: always exit with success
# 0: FATAL errors or errors in PDF checks will
#    move the input job (PostScript) to the error queue and
#    notify the client user with HELIOS standard methods
exit0 => 0,

# after finishing "pdfcheck.pl" a postprocessing script might be called
# e.g. to send notifications to the user
# will be found only if in the same directory as pdfcheck.pl
# postprocess => 'pdfcheck.postprocess.pl',

# base for out/err/warn/copy dir
# default is to have those directories within the user dir
# userdirout => '',
# __DIR__ must be present and is replaced by ok/warning/error/copy as configured above
# __USER__ will be replaced by content of $ENV{HELIOS_JOBFOR}
# relative path starting from dir where the input pdf file arrives
# userdirout => '../../__DIR__/__USER__',

# optionally remove suffixes from PDF files and report files
# "somefile.indd.pdf" becomes "somefile.pdf", "somefile.indd.report.pdf" becomes "somefile.report.pdf"
suffixremove => [ '.indd', '.qxd', '.qxp' ],

# optionally remove prefixes from PDF files and report files
# "123456_somefile.pdf" becomes "somefile.pdf", "123456_somefile.report.pdf" becomes "somefile.report.pdf"
# prefixremove => [ '[0-9]{6}_' ],

# extra options to "dt mv" or "dt cp"
# e.g. want to have a notify event triggered each time a file is moved/copied:
# dtopts => ('-E')
# + "suppress close delay for desktop"
dtopts => ['-E', '-X'],

# profile to use as a last resort
# defaultprofile => '/path/to/profil.kfp',
defaultprofile => 'CMYK_Spot_Offsetdruck.kfp',

# regex to configure possible filename addition which signals profile to use
# leave empty to disable
# profileext => '',
# or use Perl regex which captures keys in first match ($1)
profileext1 => '_4c|_4cs',

# set to 1 if you want to have profile key from profileext1 be removed from input filename
# only effecitve if profileext1 und extlookup is set
profkeyremove => 1,

# lookuptable for filename profile recognition, use lower-case keys
# leave empty to disable
# extlookup => '',
# or use hash reference { key => path_to_profile }
extlookup => {
	'_4c' => 'CMYK_Offsetdruck.kfp',
	'_4cs' => 'CMYK_Spot_Offsetdruck.kfp',
	},

# generated files will use these suffixes
x3suffix => '.x3.pdf',
txtreportsuffix => '.html',
# txtreportsuffix => '.report.txt',
# leave empty for default of server or client, or choose text editing application, if HTML choose browser
# BBEdit: R*ch, TextMate: TxMt, Text Edit: TTXT, Safari: sfri, Firefox: MOZB
# the type code will always be set to TEXT, if creator code is used
txtreportcreator => 'sfri',
pdfreportsuffix => '.report.pdf',
infosuffix => '.info',

# maximum number of tries to avoid name conflicts by inserting a number suffix
# like "myfile.1.pdf" ... "myfile.100.pdf"
# please keep reasonably high
maxnumsuffix => 100,

infotext => '--- nur zur Info ---
Startzeit: __DATE__
Prozess ID: __PID__

Erzeuge __X3__Prüfbericht für Eingabedatei \'__FILE__\'

Bitte Geduld.

Wenn nach mehreren Minuten kein Ergebnis im Ausgabeordner erscheint, bitte diese Datei
an Axel schicken.
',

errtext => '--- Interner Feher ---
__DATE__
Es gab leider einen internen Fehler.

Die PDF/X-3 Erzeugung bzw. die Prüfung für Datei \'__FILE__\' scheiterte.

Bitte diesen Text an Axel schicken.

Prozess ID: __PID__
',

}

