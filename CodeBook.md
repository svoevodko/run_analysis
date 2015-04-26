## INITIAL FILES INFORMATION
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## WORKS
## Task 1: Merging the training and the test sets to create one data set
This task allows reading downloaded files and merging this datasets into the one big file:
- Read tables:
features.txt, activity_labels.txt, subject_train.txt, x_train.txt, y_train.txt, subject_test.txt, x_test.txt, y_test.txt
- Assign column names to the imported data
- Merge data sets using functions cbind() and rbind().

## Task 2: Extracting only the measurements on the mean and standard deviation for each measurement
This task allows subsetting dataset with columns mean() or std():
- Create a vector for the column names
- Get only columns with mean() or std() using function grep()
- Subset dataset with mean() or std() columns.

## Task 3: Using descriptive activity names to name the activities in the data set
This task allows adding new column with descriptive activity name:
- Merge dataset with mean() or std() columns with the file 'activity_labels.txt'
- Edit column names.

## Task 4: Appropriately labels the data set with descriptive variable names
- Cleaning up the variable names using loop
- Reassign the new descriptive column names.

## Task 5: From the data set in step 4, creates a second,independent tidy data set with the average of each variable for each activity and each subject
This taskallows counting average by subject and activity type:
- Install package 'plyr'
- Count average using ddply
- Export results into file using function write.table().
