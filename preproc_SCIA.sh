#!/bin/bash

filein='Precipitazionicumulatekuj5u0aco8h1kgsuc1fmmubqn5.csv'
fileanag='../SCIA_Anag_AllYears.csv'

#
for my_date in JUL-18-1987 JUL-19-1987 JUL-28-1987
do
  cat $filein | grep $my_date | sed -e "s/\ /_/g" | sed -e "s/)/_/g" | sed -e "s/(/_/g" > file1.data

  rm -f coords.data
  for row in `cat file1.data`
  do
    nome=`echo $row | cut -d ',' -f2`
    long=`cat $fileanag | sed -e "s/\ /_/g" | sed -e "s/)/_/g" | sed -e "s/(/_/g" | grep $nome | cut -d',' -f4 | head -n1`
    lati=`cat $fileanag | sed -e "s/\ /_/g" | sed -e "s/)/_/g" | sed -e "s/(/_/g" | grep $nome | cut -d',' -f5 | head -n1`
    echo "$nome $long $lati" >> coords.data
  done

  paste -d',' coords.data file1.data | sed -e "s/,/\ /g" > SCIA_${my_date}.data
  rm -f coords.data file1.data
done

exit 0;

