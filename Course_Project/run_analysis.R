##########################################################################################

## Amber Beasock
## 10NOV2015

## Coursera Getting and Cleaning Data Course Project

# Downloaded the UCI HAR Dataset from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##########################################################################################

library(plyr) #Used later for creation of the final tidy data set

# Set working directory to the location where the UCI HAR Dataset was downloaded to
setwd('/Users/Beasock/R/Getting and Cleaning Data/Course Project/UCI HAR Dataset/')


# Read in features & activity labels
features <- read.table("./features.txt")
featureLabels <- features[,2]

activity_labels <- read.table("./activity_labels.txt", col.names = c('activityId', 'activityLabel')) 

# Read in the training data
subject_train <- read.table("./train/subject_train.txt", col.names = "subjectId")
x_train <- read.table("./train/X_train.txt") 
colnames(x_train) = featureLabels # Appropriately labels the x_train data set with descriptive variable names from the features dataset
y_train <- read.table("./train/y_train.txt", col.names = "activityId")

# Create the final train dataset by binding subject_train, x_train, and y_train
train <- cbind(subject_train, x_train, y_train)

# Read in the test data
subject_test <- read.table("./test/subject_test.txt", col.names = "subjectId")
x_test <- read.table("./test/X_test.txt")
colnames(x_test) = featureLabels # Appropriately labels the x_test data set with descriptive variable names from the features dataset
y_test <- read.table("./test/y_test.txt", col.names = "activityId")

# Create the final test dataset by binding subject_test, x_test, and y_test
test <- cbind(subject_test, x_test, y_test)

# Set the final test and train datasets together
combinedData <- rbind(test, train)

# Subset for only columns with "mean()" or "std()" in their names, plus the columns with subjectId and activityId
extractedData <- combinedData[,grep('subjectId|activityId|-(std|mean)\\(\\)',names(combinedData),ignore.case = TRUE)]

# Merge in the descriptive activity names from the activity_label dataset to match the activity_id
finalData <- merge(activity_labels, extractedData, by="activityId")

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
tidyData <- ddply(finalData, .(subjectId, activityLabel), function(x) colMeans(x[, 4:69]))
write.table(tidyData, file="../tidy_data.txt", row.names=FALSE, col.names=TRUE, sep=",")