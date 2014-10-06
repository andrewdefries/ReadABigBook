#################
library(XML)
library(parallel)
library(RSQLite)
#################
rm(list=ls())
#system("rm *.sqlite")

#unzip the archive first

#get the list of work
files<-list.files(pattern=".nxml", recursive=TRUE)

#########
DoTheEmbedding<-function(u){
#########
#load file
doc<-htmlParse(files[u])

#load query #//Author //Body
#query<-"//publisher-name"
#query<-"//abstract id='Abs1'"
##query<-"//body"
#query<-"/article/abstract[@id='Abs1']"
query<-"//abstract"

#use when xml object is not rooted
#doc<-xmlRoot(doc)


#dataTable<-xpathSApply(doc, query)

#dataTable<-xmlToDataFrame(data)

datalist<-xmlToDataFrame(doc[query])##[[1]]

dataTable<-datalist$p

#dataTable<-as.character(dataTable$p[1:length(dataTable)])

##, stringsAsFactors=F, check.names=F)##, header=T)

#con<-dbConnect(SQLite(),dbname="XML_db.sqlite")
print(u)
#print(dim(dataTable))
#print(length(dataTable))

#
#
if(length(dataTable)>0){
########################
dataTable<-as.data.frame(dataTable)
####print(dataTable)
#only want the first hit
#dataTable<-dataTable[1]
#dataTable<-dataTable$p[1]
names(dataTable)<-c("text")

###

###

#write to db
sql<-paste("INSERT INTO MyQuery VALUES ($text)", sep="") 

con<-dbConnect(SQLite(),dbname="XML_db.sqlite")
dbBeginTransaction(con)
dbGetPreparedQuery(con,sql,bind.data=dataTable)
dbCommit(con)
dbDisconnect(con)
########################
} else {

print(paste(u, "has no entry", sep=" "))

}
#########d
}
#u<-28272#:length(files) #26326
#u<-26324 #28272#:length(files) #26326 78051
u<-348  ##:length(files)

#########
lapply(u, try(DoTheEmbedding, silent=T)) ##, mc.cores=4)
#mclapply(u, DoTheEmbedding, mc.cores=4)


#dbDisconnect(con)

rm(list=ls())
