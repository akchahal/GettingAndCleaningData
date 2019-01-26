# GettingAndCleaningData
This is the course project for the Getting and Cleaning Data Coursera course 3. 

The data used here is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### The R script, run_analysis.R, does the following:

* Download and unzip the dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Set the working directory
* Load the train and test datasets
* Load the activity and feature datasets 
* Merge activity and subject columns with the respective test and train datasets
* Now merge the two datasets -train and test
* Subset the merged dataset keeping only those columns which reflect a mean or standard deviation
* Converts the activity and subject columns into factors
* Use library reshaoe2 to melt and dcast 
* Create a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.

### The end result is shown in the file tidy.txt.
