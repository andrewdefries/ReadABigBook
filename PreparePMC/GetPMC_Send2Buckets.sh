#wget ftp://ftp.ncbi.nlm.nih.gov/pub/pmc/file_list.pdf.txt


cat file_list.pdf.txt | sed '1d' | sed 's/^/ftp:\/\/ftp.ncbi.nlm.nih.gov\/pub\/pmc\//' | cut -d '.' -f1-6 | sed 's/$/.pdf/' > PMCgetList

#head PMCgetList

./SplitWork.sh

#wget -i PMCgetList

