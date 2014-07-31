############################
workspaces=(`ls work.NWork_*`)

for m in "${workspaces[@]}"

batch=(`pwd`)
esu=(`basename $batch`)
##
cd $m
##
thedir=(`pwd`)
use=(`basename $thedir`)
##
s3cmd mb s3://read_pubmedcentral/$esu/$use

wgethis=(`cat NWork_*`)
#cat the work to array and work on it

for t in "${wgethis[@]}"
####
do
####
wget $t

pdftotext $t -raw

textout=(`echo $t | sed 's/.pdf//g'`)

s3cmd put $t s3://read_pubmedcentral/$esu/$use
s3cmd put $textout s3://read_pubmedcentral/$esu/$use

#pdftotext $t
#pdf2svg $t
#pdfimages $t


rm $t
rm $textout

####
done
