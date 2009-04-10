#!/usr/bin/perl -i -p

# $Id: patch-txtreport.pl 5 2007-04-05 15:46:34Z axel.roeslein $

s/^=+$/'=' x 60/seg;
s/^Pfad:.+$//s;
