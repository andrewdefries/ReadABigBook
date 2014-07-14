rm -R *.NWork
rm DoWork_*

##############################################
#split Worklist into pieces by groups of lines


#split Worklist by line into chunks
split -l 12188 PMCgetList DoWork_


files=(`ls DoWork_*`)

for f in "${files[@]}"

do 

mkdir $f.NWork
mv $f $f.NWork
cp DoWork.sh $f.NWork
#cp *.R $f.NWork
#cp .gitignore $f.NWork

done


##############################################
