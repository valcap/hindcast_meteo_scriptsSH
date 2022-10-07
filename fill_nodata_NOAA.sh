cd /OCEANASTORE/progetti/spitbran/NOAA/gsod

my_missing_row='"999.9","1999-01-10","999.9","999.9","999.9","999.9","9999.9","999.9","9999.9","999.9","9999.9","999.9","9999","999.9","999.9","999.9","999.9","999.9","99.","999.9","9999.9","999.9","9999.9","999.9","99.99","999.9","999.9","999.9"'

# 1999
for f in `ls NOAA-GSOD_*_1999.csv`
do
  cat $f | head -n 10 > tmp.file
  echo $my_missing_row >> tmp.file
  cat $f | tail -n 355 >> tmp.file
  mv tmp.file 1999/$f

done

# 2018
for f in `ls NOAA-GSOD_*_2018.csv`
do
  res=`cat $f | grep "2018-09-17" | wc -l`
  if [ $res -eq 1 ]; then
    cp $f 2018/$f
  else
    cat $f | head -n 260 > tmp.file
    echo $my_missing_row >> tmp.file
    cat $f | tail -n 105 >> tmp.file
    mv tmp.file 2018/$f
   fi
done

