# Getting-and-Cleaning-Data-Course-Project


This is a repository for course project of Getting and Cleaning Data. The project is to collect and tidy the training and test data from wearable computing device (in this case, the Samsung Galaxy S smartphone).

The R script, "run_analysis.R", does the following:
1. Download data from the project data source if it doesn't exist at working directory. 
	the project data source URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names. 
6. From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The end result is saved in a file named "Tidy_Data.txt"