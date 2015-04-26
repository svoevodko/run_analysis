## Task 1: Merging the training and the test sets to create one data set ##


# Reading in the data from files
features     = read.table('./features.txt',header=FALSE); #imports features.txt
activityLabels = read.table('./activity_labels.txt',header=FALSE); #imports activity_labels.txt
subjectTrain = read.table('./train/subject_train.txt',header=FALSE); #imports subject_train.txt
xTrain       = read.table('./train/x_train.txt',header=FALSE); #imports x_train.txt
yTrain       = read.table('./train/y_train.txt',header=FALSE); #imports y_train.txt
subjectTest  = read.table('./test/subject_test.txt',header=FALSE); #imports subject_train.txt
xTest        = read.table('./test/x_test.txt',header=FALSE); #imports x_train.txt
yTest        = read.table('./test/y_test.txt',header=FALSE); #imports y_train.txt

# Assigning column names to the imported data
colnames(activityLabels)  = c('activityId','activityType');
colnames(subjectTrain)  = "subjectId";
colnames(xTrain)        = features[,2]; 
colnames(yTrain)        = "activityId";
colnames(subjectTest)   = "subjectId";
colnames(xTest)         = features[,2]; 
colnames(yTest)         = "activityId";

# Merging data sets
dataTrain = cbind (yTrain, subjectTrain, xTrain); #creates training dataset
dataTest = cbind (yTest, subjectTest, xTest); #creates test dataset;
dataFinal = rbind (dataTrain,dataTest); #merges training & test datasets


## Task 2: Extracting only the measurements on the mean and standard deviation for each measurement ##


# Creating a vector for the column names from the dataFinal
colNames  = colnames(dataFinal);

# Getting only columns with mean() or std()
mean_and_std_features <- grep("-(mean|std)\\(\\)", colNames)

# Subsetting dataset with columns mean() or std()
dataMean_Std <- cbind(dataFinal[, 1:2], dataFinal[, mean_and_std_features])


## Task 3: Using descriptive activity names to name the activities in the data set ##


# Correcting names dataMean_Std with the descriptive activity names
dataMean_Std = merge(dataMean_Std, activityLabels, by='activityId', all.x=TRUE);

# Removing column 'activityID'
dataMean_Std$activityId <- NULL

# Updating the colNames vector to include the new column names after merge
colNames  = colnames(dataMean_Std);


## Task 4: Appropriately labels the data set with descriptive variable names ##


# Cleaning up the variable names
for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("\\()","",colNames[i])
  colNames[i] = gsub("-std$","StdDev",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};

# Reassigning the new descriptive column names to the dataMean_Std set
colnames(dataMean_Std) = colNames;


## Task 5: From the data set in step 4, creates a second, ##
## independent tidy data set with the average of each variable for each activity and each subject ##

# Counting average
dataAvg <- ddply(dataMean_Std, .(subjectId, activityType), function(x) colMeans(x[, 2:67]))

# Export results into the file
write.table(dataAvg, "dataAvg.txt", row.name=FALSE)
