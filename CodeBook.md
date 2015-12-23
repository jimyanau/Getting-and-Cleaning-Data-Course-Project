#Code Book

This code book summarizes the resulting data fields in "tidy.txt" as a part of course project of Getting and Cleaning Data.

##Data Source
The data from the accelerometers from the Samsung Galaxy S smartphone is available from below address:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Data Structure
This tidy dataset is summarized as per below structure: 

###Identifiers
Subject: The identifier of the subject who carried out the experiment. There were 30 subjects in this dataset.

Activity_Label: Totally 6 kind of activities were tracked in this dataset:
    1 WALKING
    2 WALKING_UPSTAIRS
    3 WALKING_DOWNSTAIRS
    4 SITTING
    5 STANDING
    6 LAYING

###Measurements
In this dataset, these signals from tracking device were used to estimate variables of the feature vector for each pattern:  
    '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

    tBodyAcc-XYZ
    tGravityAcc-XYZ
    tBodyAccJerk-XYZ
    tBodyGyro-XYZ
    tBodyGyroJerk-XYZ
    tBodyAccMag
    tGravityAccMag
    tBodyAccJerkMag
    tBodyGyroMag
    tBodyGyroJerkMag
    fBodyAcc-XYZ
    fBodyAccJerk-XYZ
    fBodyGyro-XYZ
    fBodyAccMag
    fBodyAccJerkMag
    fBodyGyroMag
    fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

    Mean: Mean value
    STD: Standard deviation

Please notice that the average value of above variables were used as a summary in this dataset.


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle variable:

    gravityMean
    tBodyAccMean
    tBodyAccJerkMean
    tBodyGyroMean
    tBodyGyroJerkMean

You may referto the README and features.txt files in the original dataset to learn more about the feature selection for this dataset.
