## ReadMe file for Getting and Cleaning Data Class Project run_analysis.R script

### The script run_analysis.R takes the unzipped UCI HAR datasets and processes them to fit the rubric of the Class project. As a prerequisite for the script to work, the script needs to be in the working directory of R, and the data needs to be in a folder labelled UCI HAR dataset to also be in the working directory. 

A detailed description of the script follows:

1. Load the training and test datafiles into R.
2. Add the activity and subject names to the datafiles.
3. Merge the test and training datasets together.
4. Load the activity labels data (correlated to numbers in the above data files.)
5. Load the feature names data for each variable in the test and training datasets.
6. Delete any feature names that aren't the mean or standard deviation of a variable, and delete those columns from the dataset.
7. Cut the merged dataset of test and training data down to only columns containging mean, standard deviation, activity identifier or subject identifier.
8. Add the feature names as column names to the cut down dataset.
9. Process the column names to create variable names that fit tidy dataset rules (completely descriptive names, no spaces, no unusual characters, no caps, etc.)
10. Replace the activity identifiers with the descriptive activity names.
11. Create a tidy dataset that is the mean of all the variables left in the large dataset grouped by activity and subject.
12. Write out this file to disk in the R working directory as tidy.txt.

