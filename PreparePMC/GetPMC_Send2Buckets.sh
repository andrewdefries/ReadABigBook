#wget ftp://ftp.ncbi.nlm.nih.gov/pub/pmc/file_list.pdf.txt

cat file_list.pdf.txt | sed 's/^/ftp:\/\/ftp.ncbi.nlm.nih.gov\/pub\/pmc\//' > PMCgetList

#head PMCgetList


wget -i PMCgetList

