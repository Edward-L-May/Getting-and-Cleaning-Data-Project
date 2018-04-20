# ---
#     title: "Getting and Cleaning Data Course Project"
# author: "Edward May"
# date: "April 19, 2018"
# ---

library("data.table", lib.loc="~/R/win-library/3.4")
library(reshape2)


## Getting and Cleaning Data Course Project
# 
# This is a project to tidy the data from the 
# 
# Human Activity Recognition Using Smartphones Dataset
# Version 1.0
# from:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 
# Attribution and License:
#     
#     Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
# 
# [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
# 
# This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
# 
# Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
# 
# #Loading Data
# ##Unzip data set
# We first unzip the files creating a directory structure:
    
    
setwd("~/Coursera/Getting and Cleaning Data/Project/UCI HAR Dataset")
# dir(recursive=TRUE)

##Load data into variables

x_test <- read.table("test/X_test.txt")   ## single or multiple spaces between entries are handles by read.table
features <- readLines("features.txt")
xnames <- colnames(x_test)
setnames(x_test,xnames,features)            ##sets the column names for x_test
y_test <- readLines("test/y_test.txt")
x_test$label <- y_test                 ##adds the column with test labels
subject_test <- readLines("test/subject_test.txt")
x_test$subject <- subject_test
##now change the labels to descriptive test  (there's probably an easier way to do this)
activity_labels <- read.table("activity_labels.txt")
x_test$label <- gsub("1",activity_labels[1,2],x_test$label)
x_test$label <- gsub("2",activity_labels[2,2],x_test$label)
x_test$label <- gsub("3",activity_labels[3,2],x_test$label)
x_test$label <- gsub("4",activity_labels[4,2],x_test$label)
x_test$label <- gsub("5",activity_labels[5,2],x_test$label)
x_test$label <- gsub("6",activity_labels[6,2],x_test$label)

# Now reduce the file to only the mean and standard deviation columns:

stdandmean <- (grepl("mean",features) | grepl("Mean",features) | grepl("std",features))
x1_test <- x_test[,stdandmean]
#View(x1_test)

# Now repeat for the Training dataset

x_train <- read.table("train/X_train.txt" )   ## single or multiple spaces between entries are handles by read.table
xnames <- colnames(x_train)
setnames(x_train,xnames,features)            ##sets the column names for x_train
y_train <- readLines("train/y_train.txt")
x_train$label <- y_train                 ##adds the column with train labels
subject_train <- readLines("train/subject_train.txt")
x_train$subject <- subject_train
##now change the labels to descriptive words  (there's probably an easier way to do this)
activity_labels <- read.table("activity_labels.txt")
x_train$label <- gsub("1",activity_labels[1,2],x_train$label)
x_train$label <- gsub("2",activity_labels[2,2],x_train$label)
x_train$label <- gsub("3",activity_labels[3,2],x_train$label)
x_train$label <- gsub("4",activity_labels[4,2],x_train$label)
x_train$label <- gsub("5",activity_labels[5,2],x_train$label)
x_train$label <- gsub("6",activity_labels[6,2],x_train$label)

# Now reduce the file to only the mean and standard deviation columns:

stdandmean <- (grepl("mean",features) | grepl("Mean",features) | grepl("std",features))
x1_train <- x_train[,stdandmean]
#View(x1_train)

# now add a column indicating the data source and row bind the two data sets

x1_test$dataset <- "test"
x1_train$dataset <- "train"
all <- rbind(x1_test,x1_train)

# We can look at the combinations of subjects and positions with:

table(all$subject,all$label)

# We need a logical list of the variable names:

rf <- features[stdandmean]

# then we melt and cast the data:
meltall <- melt(all,id=(c("subject","label")),measure.vars = rf)
meanall <- dcast(meltall,subject+label ~ rf,mean )
final <- meanall[order(as.numeric(meanall$subject),meanall$label),order(as.numeric(names(meanall)))]

#now clean up leaving only all and final

# d <- list()
# d <- ls()
# d <- d[d != "final" & d !="all"]
# rm(list = d)

write.table(final,"tidyData.txt",row.names=FALSE)

