############################
workspaces=(`ls -d work.NWork_*`)

for m in "${workspaces[@]}"
do
####
batch=(`pwd`)
esu=(`basename $batch`)
##
cd $m
##
thedir=(`pwd`)
use=(`basename $thedir`)
##

wgethis=(`cat NWork_*`)
#cat the work to array and work on it

for t in "${wgethis[@]}"
####
do
####
wget $t

pdfname=(`basename $t`)

#pdftotext $t -raw

#pdfname=(`ls *.pdf`)
#textout=(`echo $pdfname | sed 's/.pdf//g'`)

s3cmd put $pdfname s3://read_pubmedcentral/$esu/$use/$pdfname
#s3cmd put $textout s3://read_pubmedcentral/$esu/$use/$textout

#pdftotext $t
#pdf2svg $t
#pdfimages $t


#rm $pdfname
#rm $textout

rm $pdfname
cd ..
####
##s3cmd put --recursive $m s3://read_pubmedcentral/ ##$esu/$use/
##rm -r $m
echo "next workspace"

done


done
