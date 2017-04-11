#!/bin/bash
#get the the first number from $1
c=`expr "$1" : '^\([0-9]*\).*$'`
echo $c
f=$1

#integer addition
d=`expr $c + 1`
echo $d

#munge new file, no clobber
t="$d"
q=${f#*.}
s="$t.$q"
echo "$s"
cp -n $f $s
gedit $s
