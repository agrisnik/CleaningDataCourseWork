# tidy_Data_avg.txt - Code book
###Overview
This document describes data set in file tidy_Data_avg.txt, which is a part of outcomes from course "Getting and Cleaning data" provided by online learning community Coursera. The data set is produced automatically by R script "run_analysis.R" that should be available in the same directory or GitHub repository as this document. 
The data set and the mentioned R script is produced by **Agris Nikitenko** in February 2015. 
###Data semantics
THe data have been produced automatically from raw data collected within the research on "Human Activity Recognition Using Smartphones Dataset". The authors of the research are:
> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
> >Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universitą degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

From this initial raw data a merged data set was produced by merging both training and testing data. Aftwerwards subject indexes and activity names as seperate columns were added for better readability. This merged data set was filterred by removing all column but those that describe mean values and standard deviation values for the measurements and the discriptive columns subject and activity. The resulting data set was used to make the "tidy_Data_avg.txt" by averaging all the values (except activity names and subjects) and grouping them by activity names and subjects.
Thereby eash element represents the average mean value and average standard deviation of measurements acquired by given subject performing particular action. 

###Data set structure
Data set "tidy_Data_avg.txt" is composed of rows and columns, where each element represents an average values of particular activity and subject (values are grouped by subjects and activities performed). Each value represents a real number both positive and negative, column ACTIVITY has string values representing activity names and column SUBJECT has integer values representing experiment subjects. 

Columns staring with t like "tBodyAcc-mean()-Z" represent values for measurments in time domain while those starting with f represent values from measurements afeter application of FFT - Fast Forier Transform i.e. frequency domain. 

Here is complete column list:

"ACTIVITY"                        "SUBJECT"                         "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y" 
"tBodyAcc-mean()-Z"               "tBodyAcc-std()-X"                "tBodyAcc-std()-Y"               
"tBodyAcc-std()-Z"               "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"            "tGravityAcc-mean()-Z"            "tGravityAcc-std()-X"            
"tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"             "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
"tBodyAccJerk-mean()-Z"           "tBodyAccJerk-std()-X"            "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"           
"tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"              "tBodyGyro-mean()-Z"              "tBodyGyro-std()-X"              
"tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"               "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
"tBodyGyroJerk-mean()-Z"          "tBodyGyroJerk-std()-X"           "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"          
"tBodyAccMag-mean()"              "tBodyAccMag-std()"               "tGravityAccMag-mean()"           "tGravityAccMag-std()"           
"tBodyAccJerkMag-mean()"          "tBodyAccJerkMag-std()"           "tBodyGyroMag-mean()"             "tBodyGyroMag-std()"             
"tBodyGyroJerkMag-mean()"         "tBodyGyroJerkMag-std()"          "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
"fBodyAcc-mean()-Z"               "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"                "fBodyAcc-std()-Z"               
"fBodyAcc-meanFreq()-X"           "fBodyAcc-meanFreq()-Y"           "fBodyAcc-meanFreq()-Z"           "fBodyAccJerk-mean()-X"          
"fBodyAccJerk-mean()-Y"           "fBodyAccJerk-mean()-Z"           "fBodyAccJerk-std()-X"            "fBodyAccJerk-std()-Y"           
"fBodyAccJerk-std()-Z"            "fBodyAccJerk-meanFreq()-X"       "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
"fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"              "fBodyGyro-mean()-Z"              "fBodyGyro-std()-X"              
"fBodyGyro-std()-Y"               "fBodyGyro-std()-Z"               "fBodyGyro-meanFreq()-X"          "fBodyGyro-meanFreq()-Y"         
"fBodyGyro-meanFreq()-Z"          "fBodyAccMag-mean()"              "fBodyAccMag-std()"               "fBodyAccMag-meanFreq()"         
"fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-std()"       "fBodyBodyAccJerkMag-meanFreq()"  "fBodyBodyGyroMag-mean()"        
"fBodyBodyGyroMag-std()"          "fBodyBodyGyroMag-meanFreq()"     "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-std()"     
"fBodyBodyGyroJerkMag-meanFreq()
