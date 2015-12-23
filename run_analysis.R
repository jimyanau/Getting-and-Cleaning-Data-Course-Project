
## install required package if it doesn't exists 
if (!require("data.table")) {
  install.packages("data.table")
}


## Download data if data doesn't exists:
DataFileName <- "getdata-projectfiles-UCI HAR Dataset.zip"

if (!file.exists(DataFileName)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, DataFileName)
}  


## Unzip data if data folder doesn't exists:
if (!file.exists("UCI HAR Dataset")) { 
  unzip(DataFileName) 
}

## Load activity labels from "activity_labels.txt"
ActivityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

## Read features labels from "features.txt"
FeaturesLabels = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

## Appropriately labels the data set with descriptive variable names
FeaturesLabels[,2] = gsub("-mean", "Mean", FeaturesLabels[,2])
FeaturesLabels[,2] = gsub("-std", "STD", FeaturesLabels[,2])
FeaturesLabels[,2] = gsub("[()]", "", FeaturesLabels[,2])

## Load test data.
DF_subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
DF_y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
DF_X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

## create a new column at y_test to represent activity label
DF_y_test[,2] = ActivityLabels$V2[match(DF_y_test$V1,ActivityLabels$V1)]

## Uses descriptive activity names to name the activities in the test data set
names(DF_subject_test) = "Subject"
names(DF_y_test) = c("Activity_ID","Activity_Label")
names(DF_X_test) = FeaturesLabels[,2]


## pick only the the mean and standard deviation from each measurement of X_Test
required_features <- grepl("Mean|STD", FeaturesLabels[,2])
DF_X_test = DF_X_test[,required_features]

## combine all test data into one data frame
DF_CombinedTestData <- cbind(DF_subject_test, DF_y_test, DF_X_test)


## Load train data.
DF_subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
DF_y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
DF_X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

## create a new column at y_test to represent activity label
DF_y_train[,2] = ActivityLabels$V2[match(DF_y_train$V1,ActivityLabels$V1)]

## Uses descriptive activity names to name the activities in the train data set
names(DF_subject_train) = "Subject"
names(DF_y_train) = c("Activity_ID","Activity_Label")
names(DF_X_train) = FeaturesLabels[,2]


## pick only the the mean and standard deviation from each measurement of X_trian
DF_X_train = DF_X_train[,required_features]

## combine all train data into one data frame
DF_CombinedTrainData <- cbind(DF_subject_train, DF_y_train, DF_X_train)

## remove temporary elements
rm(DF_subject_test,DF_y_test,DF_X_test,DF_subject_train,DF_y_train,DF_X_train,ActivityLabels,FeaturesLabels,required_features,DataFileName)

# Merge test and train data
DF_CombinedData = rbind(DF_CombinedTestData, DF_CombinedTrainData)

## remove temporary elements
rm(DF_CombinedTestData, DF_CombinedTrainData)

## creates a independent tidy data set with the average of each variable for each activity and each subject
ID_labels   = c("Subject", "Activity_ID", "Activity_Label")
Data_labels = setdiff(colnames(DF_CombinedData), ID_labels)
melt_data = melt(DF_CombinedData, id = ID_labels, measure.vars = Data_labels)
tidy_data = dcast(melt_data, Subject + Activity_Label ~ variable, mean)

## output tidy data to a text file
write.table(tidy_data, file = "tidy.txt",row.names = FALSE, quote = FALSE)
