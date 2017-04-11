#!/bin/sh
# sudo apt-get -y autoremove gimp gimp-plugin-registry
echo "removal complete"
sudo apt-get -y install gimp >3.txt.gimp 
echo "gimp install complete"
PERL_MM_USE_DEFAULT=1 perl -MCPAN -e'install Test::Pod' >3.txt.perl
PERL_MM_USE_DEFAULT=1 perl -MCPAN -e'install HTML::Text' >>3.txt.perl
c=`expr "$0" : '^\([0-9]*\).*\.sh$'`
echo $c




