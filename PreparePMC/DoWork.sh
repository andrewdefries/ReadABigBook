############################
filecontent=(`cat DoWork_*`)

for t in "${filecontent[@]}"
####
do
####
wget $t

here=(`pwd`)

cat $here > 

cd ..
gsutil -m cp -R

#pdftotext $t

#pdf2svg $t
#pdfimages $t

#cp to gs://pmc_new

rm *.pdf
#rm *.txt
rm *.pnm


done
