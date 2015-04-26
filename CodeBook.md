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

