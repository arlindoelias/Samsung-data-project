Getting and Cleaning Data: Samsung Data Project
===============================================  

README
------  
This document provides a brief description of how the code works. Each session of the code was properly identified in the final version of the script (run_analysis.R) to improve readability.   
The contents session below provides a summary of the main steps of the code.  
  
  
### _CONTENTS_  
  
  
PART 01: MERGE THE TRAINING AND THE TEST SET TO CREATE ONE DATA SET.  
1.1: Training set manipulation  
1.1.1: Loading Training datasets  
1.1.2: Column-bind the subject and activity sets  
1.1.3: change class 'integer' to 'factor (training set)  
1.2: Test set manipulation  
1.2.1: Loading test datasets  
1.2.2: Column-bind the subject and activity sets  
1.2.3: change class 'integer' to 'factor (training set)  
1.3: Merging datasets  
1.3.1: Merge train subjects,activity and test subjects,activity  
1.3.2: Change variable names based on the file features.txt  
1.3.3: Merge train and test sets  
  
PART 02: EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT  
2.1 Working with the merged dataset of the variables  
2.2 Cleaning variable names  
2.3 Dealing with duplicate variables (if any)  
  
PART 03: MERGING THE COMPLETE DATASET  
  
PART 04. USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE ACTIVITY NAMES  
4.1: Labelling "activity" variable  
4.2: Writing first tidy data file  
  
PART 05. CREATES A SECOND, INDEPENDENT DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT  
5.1: Melting and dcasting   
5.2: Writing FINAL tidy data file  
5.3: Testing: Loading and viewing the final tidy data set  

  
### _Code Description_
  
The first part of the code works on loading the test and training data sets. Initially, the subject and activity sets are merged and the variables transformed into factors.  
The main feature data sets were also loaded and the variable names were labeled acording to the file "features.txt".  
Finally, the training and test sets were row-binded to include all subjects.  
At this point, there were 2 datasets, one with the training and test variables, and other with the number of subjects and related activities.   
  
In the second part the mean and standard deviation of the features were extracted from the full merged feature data set. The variable names were changed into lowercase letters. The function make.unique() was applied to the column names to make each one of them exclusive. Additionally, the variable names were further transformed to eliminate "illegal" characters ("()", "," and "-").   

In the third part, the processed feature data set and the subject/activity data set were merged.  
  
In part 4, the "activity" categories were properly labeled according to the list stored in "activity_labels.txt". A copy of this first tidy data set were stored in the working directory.  
  
In the final part of the analysis the first tidy data set were melted and dcasted to present the average of each variable for each activity and each subject. This second tidy data set were recorded in the working directory and prepared to be submitted to the github repository. 

The dimension of the final data set are 180 columns and 81 variables (2 categorical and 79 numeric, including frequency domain features). 
















