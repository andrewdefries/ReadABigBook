rm -R *.NWork

##############################################
#split Worklist into pieces by groups of lines

gsutil ls gs://pubchem/*.sdf > Worklist


#split Worklist by line into chunks
split -l 120 Worklist DoWork_

#chmod +x DoWork_*


files=(`ls DoWork_*`)

for f in "${files[@]}"

do 

mkdir $f.NWork
cp $f $f.NWork
cp DoWork.sh $f.NWork
cp *.R $f.NWork
cp .gitignore $f.NWork

done


##############################################
