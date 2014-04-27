## Getting and cleaning Data: Samsung Data Project
## Version FINAL: 26/04/2014
## Analyst: Arlindo Elias

## Objectives:
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

#################################

# Packages
install.packages("plyr")
install.packages("reshape2")
library(plyr)
library(reshape2)

#################################

# PART 01: MERGE THE TRAINING AND THE TEST SET TO CREATE ONE DATA SET.
# -------------------------------------------------------------------


# 1.1: Training set manipulation


# 1.1.1: Loading Training datasets
trainData1 <- read.table("./train/subject_train.txt", header=T)
trainData2<- read.table("./train/X_train.txt", header=T)
trainData3 <- read.table("./train/y_train.txt", header=T)


# 1.1.2: Column-bind the subject and activity sets
trainData4 <- cbind(trainData1, trainData3)
colnames(trainData4) <- c("subject", "activity") # change variable names
rm(trainData1, trainData3)


# 1.1.3: change class 'integer' to 'factor (training set)
trainData4[,1] <- as.factor(trainData4[,1])
trainData4[,2] <- as.factor(trainData4[,2])
sapply(trainData4[1,], class) #verify
table(trainData4) # check 2x2 table



# 1.2: Test set manipulation


# 1.2.1: Loading test datasets
testData1 <- read.table("./test/subject_test.txt", header=T)
testData2 <- read.table("./test/X_test.txt", header=T)
testData3 <- read.table("./test/y_test.txt", header=T)

# 1.2.2: Column-bind the subject and activity sets
testData4 <- cbind(testData1, testData3)
colnames(testData4) <- c("subject", "activity") # change variable names
rm(testData1, testData3)

# 1.2.3: change class 'integer' to 'factor (training set)
testData4[,1] <- as.factor(testData4[,1])
testData4[,2] <- as.factor(testData4[,2])
sapply(testData4[1,], class) #verify
table(testData4) # check 2x2 table



# 1.3: Merging datasets

# 1.3.1: Merge train subjects,activity and test subjects,activity
mergedData1 <- rbind(trainData4, testData4)
head(mergedData1)
table(mergedData1)

# 1.3.2: Change variable names based on the file features.txt
featList <- read.table("features.txt", header=F)
featList2 <- as.vector(featList$V2)
colnames(trainData2) <- as.character(featList2)
colnames(testData2) <- as.character(featList2)

# 1.3.3: Merge train and test sets
mergedData2 <- rbind(trainData2, testData2)
names(mergedData2)


## At this point, there are 2 datasets, one with the training and test variables, and other with the number of subjects
## and related activities. 


###########################################


# PART 02: EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT
# ----------------------------------------------------------------------------------------


# 2.1 Working with the merged dataset of the variables
index <- grep("mean()", names(mergedData2))
index2 <- grep("std()", names(mergedData2))
length(c(index,index2)) # check the indexes of the required variables

mergedData3 <- mergedData2[,c(index,index2)] # build a dataset with the selected variables
mergedData4 <- mergedData2[,c(index,index2)]
names(mergedData3)  # Check variable names


# 2.2 Cleaning variable names
colnames(mergedData3) <- gsub("-", "", names(mergedData3))
colnames(mergedData3) <- gsub(",", "", names(mergedData3))
colnames(mergedData3) <- gsub(')', "", names(mergedData3))
colnames(mergedData3) <- gsub("\\(", "", names(mergedData3))
colnames(mergedData3) <- tolower(names(mergedData3))


# 2.3 Dealing with duplicate variables (if any)
colnames(mergedData3) <- make.unique(names(mergedData3))


############################################


# PART 03: MERGING THE COMPLETE DATASET
# -------------------------------
mergedData5 <- cbind(mergedData1, mergedData3)
names(mergedData5)

mergedData6 <- mergedData5 #backup data set


############################################

# PART 04. USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET
#          APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE ACTIVITY NAMES
# -------------------------------------------------------------------------

# 4.1: Labelling "activity" variable
table(mergedData6$activity)
actlabels <- factor(c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying"))

for(i in 1:6){
        mergedData6$activity <- gsub(i, actlabels[i], mergedData6$activity)}

tidyData1 <- mergedData6
tidyData1$activity <- as.factor(tidyData1$activity)

tidyData1$subject <- as.factor(tidyData1$subject)
sapply(tidyData1[1,], class)

tidyData1 <- tidyData1[order(tidyData1$subject),]
View(tidyData1)

# 4.2: Writing first tidy data file
write.table(tidyData1, file="tidyData1.txt") # Write the file for submission
write.table(tidyData1, file="tidyDataorder.txt")
## "tidyData1" is the first tidy data set to be sent for peer assessment


##############################################

# PART 05. CREATES A SECOND, INDEPENDENT DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
# --------------------------------------------------------------------------------------------------------------

# 5.1: Melting and dcasting
tidyData2 <- tidyData1

tidyMelt <- melt(tidyData2, id=c("subject", "activity"))
head(tidyMelt)

tidyMelt2 <- dcast(tidyMelt, subject + activity ~ variable, mean)
head(tidyMelt2[,1:5], n=10)


# 5.2: Writing FINAL tidy data file
write.table(tidyMelt2, file="tidyData2.txt") # Write the second file for submission


## 5.3: Testing: Loading and viewing the final tidy data set
# The tidyDataFinal.txt file must be in the working directory
data <- read.table("tidyDataFinal.txt", header=T)
View(data)
dim(data)

################################################
## End of Script



