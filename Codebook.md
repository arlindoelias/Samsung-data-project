Getting and Cleaning Data: Samsung Data Project
================================================

This data set comes from the Human Activity Recognition Using Smartphones Dataset, available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  
  
The data set is a multivariate time series built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.  
  
This document provides an overview of the project explaining how the data was collected and processed, detailed information regarding the feature selection process for both time and frequency domains, and finally, a description of the transformations that were applied to the dataset to organize the output of the submitted "tidy data". The first two sections were extracted from the 'readme.txt' and 'features_info.txt' that are provided along with the data.


  
Overview of the Project
-----------------------

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
  
  
    
Feature Information
--------------------

The time domain signals are identified with a small 't' to denote time and were acquired at a rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).   
  
Frequency domain signals were produced by a Fast Fourier Transform (FFT) and are denoted by a small 'f'. 

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Each time domain or frequency domain variables are of 'numeric' type.
  
__Time domain features:__  
Body acceleration: tBodyAcc-XYZ  
Gravity acceleration: tGravityAcc-XYZ   
Body acceleration jerk: tBodyAccJerk-XYZ  
Body gyro: tBodyGyro-XYZ  
Body gyro jerk: tBodyGyroJerk-XYZ  
Body acceleration magnitude: tBodyAccMag  
Gravity acceleration magnitude: tGravityAccMag  
Body acceleration jerk magnitude: tBodyAccJerkMag  
Body gyro magnitude: tBodyGyroMag  
Body gyro jerk magnitude: tBodyGyroJerkMag 
  
__Frequency domain features:__  
Body acceleration frequency:  fBodyAcc-XYZ  
Body acceleration jerk frequency:  fBodyAccJerk-XYZ  
Body gyro frequency:  fBodyGyro-XYZ  
Body acceleration magnitude frequency:  fBodyAccMag  
Body acceleration jerk magnitude frequency:  fBodyAccJerkMag  
Body gyro magnitude frequency:  fBodyGyroMag  
Body gyro jerk magnitude frequency:  fBodyGyroJerkMag 
  
__Additional Variables__  
Subject: integer referring to each study participant  
Activity: character variable coding each od the following activities ("walking", "walking upstairs", "walking downstairs", "sitting", "standing", "laying")

  
Data Transformations
--------------------
  
The main transformations applied to the data are described as follows:  
  
* Each feature in the raw test and train data were labeled according to the feature list provided.
  
* The train and test sets were merged into a full data set. 
  
* The mean and standard deviation of each feature were identified and extracted for analysis.  
  
* The categorical variables "subject" and "activity were added to the data and transformed into 'factor' variables.  
  
* The "activity"" categories were labeled acording to each activity name (lowercase letters), avoiding unnecessary abbreviations and coding. 
  
* Each variable name were changed to lowercase letters. The function make.unique() was applied to the column names to make each one of them exclusive. Additionally, the variable names were further transformed to eliminate "illegal"" characters ("()", "," and "-").  
  
* The final data set was processed to present the average of each variable for each activity and each subject.  

























