#!/bin/bash
TAB=classifiers.k
PRE=predef.k
TMP=tmp.k
rm -f $1.cos
rm -f $TMP
cat $TAB > $TMP
cat $PRE >> $TMP
cat $1 >>$TMP

kaos $TMP
echo " ***********************************************************************" >>$1.cos
echo " *             $1.cos" >>$1.cos
cat gnu.cos  >> $1.cos
cat output.cos >> $1.cos

 sed 's/\"\[/\[/g' $1.cos >$TMP.tmp
 sed 's/\]\"/\]/g' $TMP.tmp >$1.cos

rm -f output.cos|exit
# sed 's/&&/AND/g' $1.cos>$TMP.tmp
# sed 's/||/OR/g' $TMP.tmp>$1.cos

# cat $1.cos|tr [:upper:] [:lower:]>/usr/local/games/aqua/Bootstrap/000\ Switcher/$1.cos

rm -f *.tmp
rm -f tmp.k
