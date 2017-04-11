#!/bin/sh
sudo apt-get install perltidy
PERL_MM_USE_DEFAULT=1 perl -MCPAN -e'install Test::Pod' >1.txt.perl
PERL_MM_USE_DEFAULT=1 perl -MCPAN -e'install HTML::FromText' >>1.txt.perl
PERL_MM_USE_DEFAULT=1 perl -MCPAN -e'install Path::Class' >>1.txt.perl
PERL_MM_USE_DEFAULT=1 perl -MCPAN -e'install Text::Template' >>1.txt.perl
echo "call perl to find modules:"
perl 2.locate.pl.tdy >>1.txt.perl



