#Run once
echo "Getting the worklist"
#gsutil -m ls gs://pmc_clone/DoMe/*/*.pdf | wc > QueryTargetNumber
echo "Finding the pdf paths"
#gsutil -m ls gs://pmc_clone/DoMe/*/*.pdf > QueryPath

#
cat QueryTargetNumber
##

querypath=(`cat QueryPath`)
rm -r *.temp
rm *.pdf
rm *.txt

rm grepReport.txt
touch grepReport.txt
##
for i in "${querypath[@]}"
##
do
##
echo "starting $i job"
##########################
#########
echo $i | sed 's/gs:\/\/pmc_clone\/DoMe\/[0-9]\///g' > name
dirname=(`cat name`)

#
echo "making dir for $i"

mkdir $dirname.temp
cp query $dirname.temp
cp grepReport.txt $dirname.temp

cd $dirname.temp
##
gsutil -m cp $i .
##
"###############"
"###############"
"###############"
"Copied $i to local"
"###############"
"###############"
"###############"


echo "starting pdfgrep"

#querylist=(`cat query | split -l 91 ##sed '1,2!d' `)

split -l 1 query Query2do.


echo "######" >> grepReport.txt
echo "$i"

for q in ls Query2do.* 

###################
do 
targetname=(`ls *.pdf`)
pdfgrep -i -n $q $targetname >> grepReport.txt   ###options i lowercase search give line number of hit
done
###################

echo "$i" >> grepReport.txt
echo $q > out
cat out >> grepReport.txt
echo "#######" >> grepReport.txt


echo "done"
###################
#extract the whole thing 
pdftotext $targetname > targetText.txt

echo "extracted $i to txt"

#use grepReport to slice the targetText.txt
#perhaps use variable in sed
############################
cd ..
cp $dirname.temp/grepReport.txt .
############################
##
done
##
