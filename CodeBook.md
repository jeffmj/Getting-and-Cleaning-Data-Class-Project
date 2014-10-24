## Code Book for tidy.txt
The output of run_analysis.R is the file tidy.txt.  The original data files are from the UCI Human Activity Recognition project, (data found at this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 
The data generated comes from the accelerometers and gyroscope 3-axial signals generated by Samsung Galaxy S II smartphones worn by the test subjects, who then performed various activities.  

In the zipped data files there is a file called \UCI HAR dataset\features_info that gives the original variable names for each column of the dataset. The activity column, originally integers from 1 to 6, is related to actual activities by the \UCI HAR dataset\activity_labels file. 

It is important to note that ALL of the data in tidy.txt is the mean of the original mean and standard deviation calculated for each original raw variable, grouped by activity and subject. Additionally, all data was normalized by the original study authors, bound between -1 and 1, and given to us a floating point number. 

The raw data summarized in this tidy.txt file comes from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (originally prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (originally tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (originally tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (originally tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Then a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The angle between the acceleration vectors for body motion and gravity was also calculated where possible. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Lastly, each activity is denoted in the first column of the data set from 6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING, and each subject is identified by a unique number.

In the tidy.txt dataset, only the mean and standard deviation of these original signals were kept, and the variable names were expanded to be more descriptive. The following is a guide to the variable descriptions:
 * Time domain signals are denoted by the prefix "timedomainin50hz.  
 * Body motion related accelerometer signals are denoted by "acc" in the body of the variable.  
 * Gravity related accelerometer signals are denoted by "gravityacc".  
 * Body linear acceleration related signals are denoted by "bodyaccjerk"
 * Body angular velocity signals are denoted by "bodygyrojerk"
 * The magnitude of linear acceleration and angular velocity signals is denoted by "magntitude" 
 * Fast Fourier Transforms on the signal is denoted by "frequencydomaininfft"
 * Calculated angles are denoted by "angle"
 * Calculated mean of a variable is denoted by "mean"
 * Standard deviation by "stddev"
 * The axis of the reading by "x" for x axis, "y" for y axis, and "z" for z axis.
 

The following is a list of the variables in tidy.txt:

"timedomain50hzbodyaccmeanx"                      
"timedomain50hzbodyaccmeany"                     
"timedomain50hzbodyaccmeanz"                      
"timedomain50hzbodyaccstdx"                      
"timedomain50hzbodyaccstdy"                       
"timedomain50hzbodyaccstdz"  
"timedomain50hzgravityaccmeanx"                   "timedomain50hzgravityaccmeany"                  
"timedomain50hzgravityaccmeanz"                   "timedomain50hzgravityaccstdx"                   
"timedomain50hzgravityaccstdy"                    
"timedomain50hzgravityaccstdz"             
"timedomain50hzbodygyromeanx"                     "timedomain50hzbodygyromeany"                    
"timedomain50hzbodygyromeanz"                     "timedomain50hzbodygyrostdx"                     
"timedomain50hzbodygyrostdy"                      "timedomain50hzbodygyrostdz"                     
"timedomain50hzbodygyrojerkmeanx"                 "timedomain50hzbodygyrojerkmeany"                
"timedomain50hzbodygyrojerkmeanz"                 "timedomain50hzbodygyrojerkstdx"                 
"timedomain50hzbodygyrojerkstdy"                  "timedomain50hzbodygyrojerkstdz"                 
"timedomain50hzbodyaccmagnitudemean"              "timedomain50hzbodyaccmagnitudestddev"           
"timedomain50hzgravityaccmagnitudemean"           "timedomain50hzgravityaccmagnitudestddev"        
"timedomain50hzbodyaccjerkmagnitudemean"          "timedomain50hzbodyaccjerkmagnitudestddev"       
"timedomain50hzbodygyromagnitudemean"             "timedomain50hzbodygyromagnitudestddev"          
"timedomain50hzbodygyrojerkmagnitudemean"         "timedomain50hzbodygyrojerkmagnitudestddev"      
"frequnecydomainfftbodyaccmeanx"                  "frequnecydomainfftbodyaccmeany"                 
"frequnecydomainfftbodyaccmeanz"                  "frequnecydomainfftbodyaccstdx"                  
"frequnecydomainfftbodyaccstdy"                   "frequnecydomainfftbodyaccstdz"                  
"frequnecydomainfftbodyaccmeanfreqx"              "frequnecydomainfftbodyaccmeanfreqy"             
"frequnecydomainfftbodyaccmeanfreqz"              "frequnecydomainfftbodyaccjerkmeanx"             
"frequnecydomainfftbodyaccjerkmeany"              "frequnecydomainfftbodyaccjerkmeanz"             
"frequnecydomainfftbodyaccjerkstdx"               "frequnecydomainfftbodyaccjerkstdy"              
"frequnecydomainfftbodyaccjerkstdz"               "frequnecydomainfftbodyaccjerkmeanfreqx"         
"frequnecydomainfftbodyaccjerkmeanfreqy"          "frequnecydomainfftbodyaccjerkmeanfreqz"         
"frequnecydomainfftbodygyromeanx"                 "frequnecydomainfftbodygyromeany"                
"frequnecydomainfftbodygyromeanz"                 "frequnecydomainfftbodygyrostdx"                 
"frequnecydomainfftbodygyrostdy"                  "frequnecydomainfftbodygyrostdz"                 
"frequnecydomainfftbodygyromeanfreqx"             "frequnecydomainfftbodygyromeanfreqy"            
"frequnecydomainfftbodygyromeanfreqz"             "frequnecydomainfftbodyaccmagnitudemean"         
"frequnecydomainfftbodyaccmagnitudestddev"        "frequnecydomainfftbodyaccmagnitudemeanfreq"     
"frequnecydomainfftbodyaccjerkmagnitudemean"      "frequnecydomainfftbodyaccjerkmagnitudestddev"   
"frequnecydomainfftbodyaccjerkmagnitudemeanfreq"  "frequnecydomainfftbodygyromagnitudemean"        
"frequnecydomainfftbodygyromagnitudestddev"       "frequnecydomainfftbodygyromagnitudemeanfreq"    
"frequnecydomainfftbodygyrojerkmagnitudemean"     "frequnecydomainfftbodygyrojerkmagnitudestddev"  
"frequnecydomainfftbodygyrojerkmagnitudemeanfreq" "angle(tbodyaccmean,gravity)"                    
"angle(tbodyaccjerkmean),gravitymean)"            "angle(tbodygyromean,gravitymean)"               
"angle(tbodygyrojerkmean,gravitymean)"            "angle(x,gravitymean)"                           
"angle(y,gravitymean)"                            "angle(z,gravitymean)"                           
"activity"                                        
"subject"                    