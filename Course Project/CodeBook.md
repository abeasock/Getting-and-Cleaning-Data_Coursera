# Code Book                                                                          
#### *Getting and Cleaning Data - Course Project*                                         
##### Amber Beasock                                                                   

===============================================================================================================

###Raw Data Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record in the dataset is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.  

---------------------------------------------------------------------------------------------------------------

### Source Data
A full desciprtion of the data used for this project can be found at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

For this project we used the *Human Activity Recognition Using Smartphones* data set, which can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

---------------------------------------------------------------------------------------------------------------

### Objective of this project
The goal of this project is to create one R script called `run_analysis.R` that does the following:

#### 1. Merges the training and the test sets to create one data set
After downloading the data, read the following files into R:

* activity_labels.txt
* features.txt
* Test data
    * subject_test.txt
    * X_test.txt
    * y_test.txt
* Train data
    * subject_test.txt
    * X_test.txt
    * y_test.txt    

Used cbind() to bind together the test data sets. Then the same is done for the train data sets. Finally, rbind() is used to set together the test and train data. 
    
#### 2. Extracts only the measurements on the mean and standard deviation for each measurement 

The combined data set is subsetted for only variables that contain "mean" (estimated mean) or "std" (standard deviation) in the labels (plus the variables with subjectId and activityId).

#### 3. Uses descriptive activity names to name the activities in the data set
The descriptive activity names from activity_labels.txt are merged on to the data set by the activity_id column present in both data sets. 

#### 4. Appropriately labels the data set with descriptive variable names. 
Labels were updated to be more descriptive while reading in each data set.

#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Using the previous cleaned up data set, a final data set is created that only contains averages for each subject and activity type. There are 30 subjects in the data and 6 activity types for each, so the final the data set has a row for each activity type for each subject (30 * 6 = 180 rows). This final data set is called `tidy_data.txt` and has been uploaded to my GitHub repository. 

---------------------------------------------------------------------------------------------------------------

### Variable Information
#### Identifiers
* subjectId - an identifier of the subject who carried out the experiment
* activityId - values 1:6 that correspond to the the activity types
* activityLabels - the type of activity being performed by the subject when the measurement was taken

    - **WALKING**            - Value (activityId) = 1          
    - **WALKING_UPSTAIRS**   - Value (activityId) = 2          
    - **WALKING_DOWNSTAIRS** - Value (activityId) = 3          
    - **SITTING**            - Value (activityId) = 4         
    - **STANDING**           - Value (activityId) = 5          
    - **LAYING**             - Value (activityId) = 6 

#### Feature Variables
The mean( ) and std( ) of each:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The *'-XYZ'* is used to denote 3-axial signals in the X, Y and Z directions. This equals 66 measurement variables present in the final data set.