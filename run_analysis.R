# UCI HAR Dataset is presumed to be unzipped into a folder in  R working directory

#Load data files
TrainingData = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
TrainingData[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
TrainingData[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
TestingData = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
TestingData[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
TestingData[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

#Load activity names
activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

#Load feature names
featureNames = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)


# Merge training and test sets together
CombinedData <- rbind(TrainingData, TestingData)

#Create a feature list that only has variables that are the mean or Std Dev of other variables
featureList <- grep("mean|Mean|Std|std",featureNames[,2])

#Keep activity and subject (cols 562,563)
featureList <- c(featureList,562,563)

#Add activity (col 562) and subject (col 563) to featureNames
activity <- data.frame(V1 = 562, V2 = "activity")
subject <- data.frame(V1 = 563,V2 = "subject")
featureNames <- rbind(featureNames,activity,subject)

#reduce featureNames to only columns with mean,std, activity or subject
featureNames <- featureNames[featureList,]


#reduce data set to only columns with mean, std, activity  or subject 
CombinedData <- CombinedData[,featureList]

# Add feature names to Combined Data
colnames(CombinedData) <- featureNames$V2

#clean up featureNames to fit tidy data rules: no (), no  -, descriptive names 

  colnames(CombinedData) = gsub("\\()","",colnames(CombinedData))
  colnames(CombinedData) = gsub("\\-","",colnames(CombinedData))
  colnames(CombinedData) = gsub("std$","StdDev",colnames(CombinedData)) 
  colnames(CombinedData) = gsub("-mean","Mean",colnames(CombinedData))
  colnames(CombinedData) = gsub("^(t)","timedomain50hz",colnames(CombinedData))
  colnames(CombinedData) = gsub("^(f)","frequnecydomainFFT",colnames(CombinedData))
  colnames(CombinedData) = gsub("([Gg]ravity)","Gravity",colnames(CombinedData))
  colnames(CombinedData) = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colnames(CombinedData))
  colnames(CombinedData) = gsub("[Gg]yro","Gyro",colnames(CombinedData))
  colnames(CombinedData) = gsub("AccMag","AccMagnitude",colnames(CombinedData))
  colnames(CombinedData) = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colnames(CombinedData))
  colnames(CombinedData) = gsub("JerkMag","JerkMagnitude",colnames(CombinedData))
  colnames(CombinedData) = gsub("GyroMag","GyroMagnitude",colnames(CombinedData))
  colnames(CombinedData) = gsub("\\-","",colnames(CombinedData))
 
  colnames(CombinedData) <- tolower(colnames(CombinedData))

#Replace activity numbers with activity names

for (i in  1:length(activityLabels[,1])) {
  CombinedData$activity <- gsub(i,activityLabels[i,2],CombinedData$activity)
}

# Create tidy data set which is the mean of all variables grouped by activity and subject
tidy <-aggregate(CombinedData, by=list(CombinedData$activity,CombinedData$subject), mean)

#Rename Group 1 to Activity
colnames(tidy) [1] <- "activity"
 
#Rename Group 2 to Subject
colnames(tidy) [2] <- "subject"

#delete original Subject and Activity Columns, working from end of file 
tidy[,90] = NULL
tidy[,89] = NULL

# Write tidy data file to disk
write.table(tidy, "tidy.txt", row.names = FALSE)

