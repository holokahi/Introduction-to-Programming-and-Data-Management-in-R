#Bring in cameras dataset
camera_csv <- read.csv("./cameras.csv", stringsAsFactors = F)
View(camera_csv)

camera_csv$Neighborhood_2010<-camera_csv$X2010.Census.Neighborhoods
camera_csv$Wards_2010<-as.character(camera_csv[,8])
str(camera_csv)
summary(camera_csv$Wards_2010)
summary(camera_csv$X2010.Census.Wards.Precincts)

library(data.table) 
set.seed(350)
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9)) 
names(DF)
head(DF,3) 

DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3) 

#Change value of one exact observation in DT
DT$y[9]<-"b"
table(DT$y)

letter_b<-table(DT$y)[2]
letter_c<-table(DT$y)[3]
m<-as.numeric(letter_b*letter_c)
m

#Create New Object that calculates total letters
tot_letter<-length(DT$y)
tot_letter

prop_c<-letter_c/tot_letter
prop_c

DT[3,]

#Subset of A's in DT
sub_a<-DT[DT$y=="a"]
sub_a2<-subset(DT, DT$y=="a")
sub_a3<-DT[c(1:3,6:7),]
sub_a3
View(sub_a3)

#Subsetting based on variables to keep from camera_csv
myvars<-c("address", "intersection", "X2010.Census.Wards.Precincts")
cam_sub<-camera_csv[myvars]
cam_sub2<-camera_csv[,c(1,5,8)]

#Calculates values
sum_values<-DT[,list(mean(x),sum(z), mean(z), mean(z))] 
print(sum_values)

#Removing Objects
rm(sub_a, sub_a2, sub_a3)

#Create new variable z
DT[,w:=z^2] 
DF$w<-DF$z^2

DT[,a:=2]

#Creating a new variable 'm'. First you are taking x + z then
# you are taking the log of x + z plus 5
DT[,tmp1:=x+z]
DT[,tmp2:=log2(tmp1+5)]
DT[,m:= {tmp <- (x+z); log2(tmp+5)}] 

#Evaluate the value of X to see which are neagative and positive
DT[,b:=x>0]

#Gives the mean of Trues and mean of False in b
DT[,c:= mean(x+w),by=b] 
table(DT$c)

col_true<-subset(DT, DT$b==TRUE)
col_false<-subset(DT, DT$b==F)

mean(col_true$x + col_true$w)
mean(col_false$x + col_false$w)

attach(col_true)
mean(x+w)
detach(col_true)

DT2 <- data.table(x=rep(c("a","b","c"),each=100), y=rnorm(300)) 
setkey(DT2, x) 
DT2['a'] 

set.seed(350)
DF350 = data.frame(x=rnorm(6),y=rep(c("a","b","c", "d", "e","g")))

set.seed(150)
DF150 = data.frame(z=rnorm(6),y=rep(c("a","b","c", "d", "e","h")))

DF_merge<-merge(x=DF350, y=DF150, by="y", all.x=F, all.y=F)
