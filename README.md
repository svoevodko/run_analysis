# run_analysis

Getting and Cleaning Data - Course Project
This repository contains of the R code and documentation files for the Data Science's track course "Getting and Cleaning data".

The initial dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Files:

1. run_analysis.R is the R code with the 5-steps analyses:
    Task 1: Merging the training and the test sets to create one data set
    Task 2: Extracting only the measurements on the mean and standard deviation for each measurement
    Task 3: Using descriptive activity names to name the activities in the data set
    Task 4: Appropriately labels the data set with descriptive variable names
    Task 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each     activity and each subject

2. 
CodeBook.md describes the variables, the data, and any transformations or work that was performed to clean up the data.

run_analysis.R contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file.

The output of the 5th step is called averages_data.txt, and uploaded in the course project's form.
