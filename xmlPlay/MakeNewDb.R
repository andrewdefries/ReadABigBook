library(RSQLite)

#open db if none create one
con<-dbConnect(SQLite(),dbname="XML_db.sqlite")

dbSendQuery(conn=con,
    "CREATE TABLE MyQuery
     (PMCID INTEGER, Abstract CHARACTER)")

dbBeginTransaction(con)
dbCommit(con)
dbDisconnect(con)

files<-list.files(pattern=".nxml", recursive=TRUE)

save(files, file="xmlFiles.rda", compress=T)
