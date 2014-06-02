#

gsutil ls gs://pmc_clone/DoMe/*/*.pdf | wc > QueryTargetNumber

gsutil ls gs://pmc_clone/DoMe/*/*.pdf > QueryPath


#

cat QueryTargetNumber
##

querypath=(`cat QueryPath`)

##
for i in "${querypath[@]}"
##
do
##
rm *.pdf
gsutil -m cp $querypath .
targetname=(`ls *.pdf`)
pdfgrep $targetname >> grepReport.txt   ###options i lowercase search give line number of hit

#extract the whole thing 
pdftotext $targetname > targetText.txt

#use grepReport to slice the targetText.txt
#perhaps use variable in sed



##
done
##
