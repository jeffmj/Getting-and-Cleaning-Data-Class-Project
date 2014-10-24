## ReadMe file for Getting and Cleaning Data Class Project run_analysis.R script

#### The script run_analysis.R takes the unzipped UCI HAR datasets and processes them to fit the rubric of the class project. As a prerequisite for the script to work, the script needs to be in the working directory of R, and the data needs to be in a folder labelled UCI HAR dataset also located in the working directory. 

The script performs the following steps:

1. Loads the training and test datafiles into R.
2. Adds the activity and subject names to the datafiles.
3. Merges the test and training datasets together.
4. Loads the activity labels data (correlated to numbers in the above data files.)
5. Loads the feature names data for each variable in the test and training datasets.
6. Deletes any feature names that aren't the mean or standard deviation of a variable, and deletes those columns from the dataset.
7. Cuts the merged dataset of test and training data down to only columns containing mean of a variable, standard deviation of a variable, activity identifiers or subject identifiers.
8. Adds the feature names as column names to the cut down dataset created in step 7.
9. Processes the column names to create variable names that fit tidy dataset rules (completely descriptive names, no spaces, no unusual characters, no caps, etc.)
10. Replaces the activity identifiers(numbers) with the corresponding descriptive activity names.
11. Creates a tidy dataset that is the mean of all the variables left in the large dataset grouped by activity and subject.
12. Writes out this file to disk in the R working directory as tidy.txt.

