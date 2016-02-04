## 1 Merges the training and the test sets to create one data set.

featuretest <- read.table("~/Desktop/datacleanassig/UCI HAR Dataset/test/X_test.txt", quote="", comment.char="")
featuretrain <- read.table("~/Desktop/datacleanassig/UCI HAR Dataset/train/X_train.txt", quote="", comment.char="")
subjectest <- read.table("~/Desktop/datacleanassig/UCI HAR Dataset/test/subject_test.txt", quote="", comment.char="")
subjecttrain <- read.table("~/Desktop/datacleanassig/UCI HAR Dataset/train/subject_train.txt", quote="", comment.char="")
activitytest <- read.table("~/Desktop/datacleanassig/UCI HAR Dataset/test/y_test.txt", quote="", comment.char="")
activitytrain <- read.table("~/Desktop/datacleanassig/UCI HAR Dataset/train/y_train.txt", quote="", comment.char="")

View(featuretest)
View(featuretrain)
View(subjecttest)
View(subjecttrain)

str(featuretest)
str(featuretrain)
str(subjecttest)
str(subjecttrain)
str(activitytest)
str(activitytrain)

subjectdata <-rbind(subjecttest, subjecttrain)
activitydata <- rbind(activitytest, activitytrain)
featuredata <- rbind(featuretest, featuretrain)

View(featuredata)
View(subjectdata)
View(activitydata)

names(subjectdata) <- c("subject") 
names(activitydata) <- c("activity")
xtest <- read.table("~/Desktop/datacleanassig/UCI HAR Dataset/test/X_test.txt", header = FALSE)
View(xtest)
str(xtest)

datafeatures <- read.table("~/Desktop/datacleanassig/UCI HAR Dataset/features.txt", quote="", comment.char="")
View(datafeatures)
names(featuredata) <- datafeatures$V2
actsubj <- cbind(activitydata, subjectdata)
DataSet <- cbind(featuredata, actsubj)
View(DataSet)

subdatafeatures <- datafeatures$V2[grep("mea\\(\\)|std\\(\\)", datafeatures$V2)]
activitysubjectnames <- c(as.character(subdatafeatures), "activity", "subject")
DataSet <- subset(DataSet, select = activitysubjectnames)
str(DataSet)

## 3 Uses descriptive activity names to name the activities in the data set

DataSet3 <- merge(DataSet, activitynames)
str(DataSet3)
activitylabels <- read.table("~/Desktop/datacleanassig/UCI HAR Dataset/activity_labels.txt", quote="", comment.char="")
activitycode <- "V1"
activity <- "V2"
View(activitylabels)
DataSet3 <- merge(DataSet, activitylabels)


## 4 Appropriately labels the data set with descriptive variable names.

DataSet3 <- merge(DataSet, activitynames)
str(DataSet3)
activitylabels <- read.table("~/Desktop/datacleanassig/UCI HAR Dataset/activity_labels.txt", quote="", comment.char="")

names(DataSet3) <- gsub("V2", "activitylabels", names(DataSet3))
head(DataSet3, 2)
names(DataSet3) <- gsub("V2", "activitylabels", names(DataSet3))
names(DataSet3) <- gsub("t", "time", names(DataSet3))
names(DataSet3) <- gsub("f", "frequency", names(DataSet3))
names(DataSet3) <- gsub("f", "frequency", names(DataSet3))
head(DataSet3, 10)

##5 From the data set in step 4, creat a second independent tidy data set with the average for eact variable.
write.table(DataSet3, file = "tidy.txt", row.name = FALSE, col.names = TRUE)

