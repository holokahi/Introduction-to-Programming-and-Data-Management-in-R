# | equals OR
# & equals AND
library(tictoc)
library(plyr)

set.seed(13435)
X <- data.frame("var1"=sample(1:5, replace = T),"var2"=sample(6:10),
                "var3"=sample(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA

X[(X$var1 <= 3 & X$var3 > 11),]
X[(X$var1 <= 3 | X$var3 > 15),]
X[which(X$var2 > 8),]

sort(X$var1)
X[order(X$var1),]
X[order(X$var1,X$var3),]
X$var4 <- rnorm(5)

#Deal with missing
summary(X$var2)
colSums(is.na(X))
avg_var2<-round(mean(X$var2, na.rm=T),2)
avg_var2_pipe<-mean(X$var2, na.rm=T) %>% round()

#Check for missing values
sum(is.na(X$var2))
table(is.na(X$var2))
X$var2_flag<-is.na(X$var2)

#Make flag categorical
X$flag_cat<-ifelse(X$var2_flag=="TRUE", 1, 0)

#Change missing values in var2 to the average of var2
X$var2<-ifelse(is.na(X$var2), avg_var2, X$var2)
avg_var2 %in% X$var2

#Use mtcars dataset in R
summary(mtcars$disp)
quantile(mtcars$disp,na.rm=TRUE)
colSums(is.na(mtcars))
table(mtcars$carb==4)
table(mtcars$carb %in% c(1,4))

#Testing Speed
tic("Order")
X[order(X$var1),]
toc()

tic("plyr")
arrange(X,var1)
toc()




