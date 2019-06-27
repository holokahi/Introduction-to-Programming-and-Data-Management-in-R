#Use Selector Gadet

library("xml2")
library("XML")
library("rvest")

timmy<-read_html("https://www.basketball-reference.com/players/d/duncati01/gamelog/2014")
Grab_stats<-html_nodes(timmy, "#pgl_basic")

Stats_bball<-html_text(Grab_stats)
Stats_bball

doc<-htmlTreeParse(timmy,useInternal=T)
stats<-xpathSApply(doc, "//*[(@id = \"pgl_basic\")]",xmlValue)
stats

library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
head(jsonData)

jsonData$name
names(jsonData$owner)
jsonData$owner$url

View(iris)
myjson <- toJSON(iris, pretty=TRUE)
cat(myjson)

#SQL
library(RMySQL)
ucscDb <- dbConnect(MySQL(),user="genome", 
                    host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb)
result

hg19 <- dbConnect(MySQL(),user="genome", db="hg19",
                  host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)

allTables[1001:1006]
dbListFields(hg19,"affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

#Using SQL Language to bring in data
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)
dbDisconnect(hg19)


