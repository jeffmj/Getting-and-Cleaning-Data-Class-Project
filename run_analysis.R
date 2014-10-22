# Load needed libraries

library("dplyr", lib.loc="~/R/win-library/3.1")   # Load dplyr library  
library("httr", lib.loc="~/R/win-library/3.1")    # Load httr library

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
activity <- data.frame(V1 = 562, V2 = "Activity")
subject <- data.frame(V1 = 563,V2 = "Subject")
featureNames <- rbind(featureNames,activity,subject)

#reduce featureNames to only columns with mean,std, activity or subject
featureNames <- featureNames[featureList,]

#reduce data set to only columns with mean, std, activity  or subject 
CombinedData <- CombinedData[,featureList]

# Add feature names to Combined Data
colnames(CombinedData) <- featureNames$V2

#Replace activity numbers with activity names

for (i in  1:length(activityLabels[,1])) {
  CombinedData$Activity <- gsub(i,activityLabels[i,2],CombinedData$Activity)
}

# Create tidy data
tidy <-aggregate(CombinedData, by=list(CombinedData$Activity,CombinedData$Subject), mean)

#Rename Group 1 to Activity
colnames(tidy) [1] <- "Activity"
 
#Rename Group 2 to Subject
colnames(tidy) [2] <- "Subject"

#delete original Subject and Activity Columns, working from end of file 
tidy[,90] = NULL
tidy[,89] = NULL

# Write tidy data file to disk
write.table(tidy, "tidy.txt", sep="\t", row.names = FALSE)

