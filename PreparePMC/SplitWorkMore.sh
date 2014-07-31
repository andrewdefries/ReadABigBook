#####################
rm -r work.CoreWork_*
#####################
splitval=12188
cores=8
#cores=(`nproc`) fix later
total=(`cat PMCgetList | wc -l`)


let "coresplit=total/cores"

split -l $coresplit PMCgetList CoreWork_

corework=(`ls CoreWork_*`)

let "sweet=coresplit/48"

for t in "${corework[@]}"

do
######
mkdir work.$t

mv $t work.$t
cp DoWork.sh work.$t

cd work.$t
split -l $sweet $t NWork_
##
final=(`ls NWork_*`)

for f in "${final[@]}"
do

mkdir work.$f
mv $f work.$f


#####
done

cd ..
######
done
