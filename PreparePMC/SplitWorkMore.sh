rm -r work.CoreWork_*
#####################
splitval=12188
cores=8
total=(`cat PMCgetList | wc -l`)


let "coresplit=total/cores"

split -l $coresplit PMCgetList CoreWork_

corework=(`ls CoreWork_*`)

let "sweet=coresplit/48"

for t in "${corework[@]}"

do
######
mkdir work.$t
split -l $sweet $t $t.NWork_
mv $t.NWork_* work.$t
mv $t work.$t
cp DoWork.sh work.$t
######
done
