##COurse Project for Coursera: Getting and Cleaning Data

Data:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
Data and its description was obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Steps:
1) Unzip data from the zip file 
2) Read and load X_train.txt, y_train.txt and subject_train.txt from the "./project/train" folder. These are the training data
3) Similarly, read and load X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder. These are the test data
4) Join the training and test data together into 3 datasets; xdata, label and sub
5) Read and load the features.txt file from the "/data" folder. This dataset correspond to the variable names of the dataset in xdata
6) In the features dataset, identify measurements for mean and std only using regular expression. 
7) From the above indices, subset the xdata dataset to obtain the desired mean and std measurements only as a new xdata2 dataset.
8) Label the columns of the xdata2 dataset with the names of the measurements from the features dataset
9) Read and load activity_labels.txt file from the "./data"" folder as activity dataset
10) Update the label dataset with the activity name using the activity dataset by substituting the values by subsetting. 
11) Label the column in the label dataset and sub dataset with the correct name "activty" and "subject" respectively.
12) Use cbind to merge xdata2, label and sub datasets together into a complete set of data. 
13) Write results all_data.txt out to "./project"
14) Generate a second independent tidy set with the average of each variable for each activity and each subject using ddply.
15) Write the results tidy_data.txt to "./project"

#Variables: 
a) x_train, y_train, x_test, y_test, subject_train and subject_test are files that contain the downloaded raw data.
b) xdata, label, and sub merge the previous datasets for further analysis.
c) features file contain the correct names for the xdata dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data into xdata2
d) all_data is the final data set after merging x_data2, label and sub.
e) tidy_data contains the  average for each activity and subject from  all_data . 

