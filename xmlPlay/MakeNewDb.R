library(RSQLite)

#open db if none create one
con<-dbConnect(SQLite(),dbname="XML_db.sqlite")

dbSendQuery(conn=con,
    "CREATE TABLE MyQuery
     (text CHARACTER)")

dbBeginTransaction(con)
dbCommit(con)
dbDisconnect(con)

