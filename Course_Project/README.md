## Getting and Cleaning Data - Course Project

--------------------------------------------------------------------------------------

###Introduction
This respository is for the Getting and Cleaning Data course project by John Hopkins on Coursera. The purpose of this project is to prepare a tidy data set by collecting, transforming, and cleaning data that will subsequently be used to create a new tidy data set for further data analysis.

A full desciprtion of the data used for this project can be found at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).


###Project Summary

The R script, `run_analysis.R`, located in the repo does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The file containing the independent tidy data set referred to in step 5 can be found in the repo named `tidy_data.txt`.


###Modifications to the R Script

You will need to first download and unzip the source data into your working directory. The source data for this project is the *Human Activity Recognition Using Smartphones* data set, which can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

Once you have the source data in your working directory, you will need to modify the R script, `run_analysis.R`, before you can process the data. In the script, update line 16 to set the path of the working directory to the location of your directory with the downloaded source files. In the final line (line 54) , you will need to update the "file = " argument to be the location where you want to output the file `tidy_data.txt`. 

The R script assumes that the PLYR package has already been installed. If you don't have this package already installed, then run `install.package("plyr")` in R before running `run_analysis.R`.   

###Additional Information

Further information about the data, variables, and transformations can be in the file  `CodeBook.md` located in this repo.