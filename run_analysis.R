	## Merges the training and the test sets to create one data set.
	
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

	## Extracts only the measurements on the mean and standard deviation for each measurement.
	
	subdatafeatures <- datafeatures$V2[grep("mea\\(\\)|std\\(\\)", datafeatures$V2)]
activitysubjectnames <- c(as.character(subdatafeatures), "activity", "subject")
DataSet <- subset(DataSet, select = activitysubjectnames)
str(DataSet)

	## Uses descriptive activity names to name the activities in the data set
	
	DataSet3 <- merge(DataSet, activitynames)
str(DataSet3)

	## Appropriately labels the data set with descriptive variable names.
	## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	
	
