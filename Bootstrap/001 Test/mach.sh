#!/bin/bash
TAB=classifiers.k
TMP=tmp.k
rm -f $1.cos

cat $TAB >> $TMP
cat $1 >>$TMP

kaos $TMP
echo " ***********************************************************************" >>$1.cos
echo " *             $1.cos" >>$1.cos
cat gnu.cos  >> $1.cos
cat output.cos >> $1.cos
rm -f $TMP
rm -f output.cos|exit
