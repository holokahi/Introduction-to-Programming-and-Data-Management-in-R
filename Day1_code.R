#Bringing in camera data
url_csv <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "C:/Users/cjj529/Desktop/cameras.csv")
list.files()

#Creating Date Downloaded
dateDownloaded <- date()

camera_table <- read.table("./cameras.csv", sep=",", header = T)
View(camera_table)

camera_csv <- read.csv("./cameras.csv")
View(camera_csv)

#Figure out names of variables in camera dataset
names(camera_csv)

camera_csv$Neighborhood_2010<-camera_csv$X2010.Census.Neighborhoods
camera_csv$Wards_2010<-camera_csv[,8]

names(camera_csv)
head(camera_csv)
