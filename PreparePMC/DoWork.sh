############################
filecontent=(`cat CoreWork_ab.NWork_*`)

for t in "${filecontent[@]}"
####
do
####
wget $t

pdftotext $t -raw

textout=(`echo $t | sed 's/.pdf//g'`)

s3cmd put $t s3://read_pubmedcentral
s3cmd put $textout s3://read_pubmedcentral

#pdftotext $t
#pdf2svg $t
#pdfimages $t


rm $t
rm $textout

####
done
