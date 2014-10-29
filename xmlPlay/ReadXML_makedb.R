#################
library(XML)
library(parallel)
#library(RSQLite)
#################
rm(list=ls())
#system("rm *.sqlite")

#unzip the archive first

#get the list of work #this slows things down
#files<-list.files(pattern=".nxml", recursive=TRUE)
load("xmlFiles.rda")


#########
DoTheEmbedding<-function(u){
#########
#load file
doc<-htmlParse(files[u])
#abstract<-xmlToDataFrame(doc[query])[[1]]
abstract<-xmlToDataFrame(getNodeSet(doc, "//abstract"))$p[1]
pmcid<-xmlToDataFrame(getNodeSet(doc, "//article-id"))$text[2]
dataTable<-cbind(as.vector(pmcid), as.vector(abstract))
#######
print(u)
#
#if(length(dataTable[2])>0){
if(sum(dim(dataTable))==3){
########################
colnames(dataTable)<-c("PMCID", "Abstract")
dataTable<-as.data.frame(dataTable)
####
#write to db
##sql<-paste("INSERT INTO MyQuery VALUES ($PMCID, $Abstract)", sep="") 
####
##con<-dbConnect(SQLite(),dbname="XML_db.sqlite")
##dbBeginTransaction(con)
##dbGetPreparedQuery(con,sql,bind.data=dataTable)
####
##while(dbCommit(con)==FALSE){
##dbCommit(con)
##}
##dbDisconnect(con)
save(dataTable, file=gsub(".nxml", ".rda", files[u]), compress=T)
########################
} else {
print(paste(u, "has no Abstract", sep=" "))
}
#########d
}
#u<-28272#:length(files) #26326
#u<-26324 #28272#:length(files) #26326 78051
u<-1:length(files)
#u<-24564:length(files)
#u<-1
#########
#lapply(u, try(DoTheEmbedding, silent=T)) ##, mc.cores=4)
mclapply(u, DoTheEmbedding, mc.cores=8)


#dbDisconnect(con)

rm(list=ls())
