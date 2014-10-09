

rm *.sqlite

sequence=(`cat Sequence`)

rm RunLog
touch RunLog

R CMD BATCH MakeNewDb.R

for i in "${sequence[@]}"
do

#cat ReadXML_makedb.R | sed "s/u<-1/u<-\$i\/g" > RunThis.R
cat ReadXML_makedb.R | sed "s/u<-1/u<-$i/g" > RunThis.R

R CMD BATCH RunThis.R

cat *.Rout >>RunLog

done
