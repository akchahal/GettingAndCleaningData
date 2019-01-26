# Getting and Cleaning Data

**The variabes used in R script run_analysis.R:**

*trainX: data loaded from file - X_train.txt 
*trainY: data loaded from file - Y_train.txt 
*trainSubject: data loaded from file - subject_train.txt   
*testX: data loaded from file - X_test.txt
*testY: data loaded from file - Y_test.txt
*testSubject:data loaded from file - subject_test.txt  
*activityLabels: data loaded from file - activity_labels.txt
*features: data loaded from file - features.txt
  
*trainData: dataset combining columns of trainX, trainY and trainSubject
*testData: dataset combining columns of testY, testSubject and testX
*mergedData: datse combining rows of trainData and testData
*columnNames: column names of mergedData
*columnsRequired: columns that refected mean and standard deviation values + activity and subject
*mergedDataset : subset of mergedData containing only columnsRequired
*meltedData: melted dataset based on id activityId and subjectId
*tidyData: final dataset with average of each variable for each activity and each subject.
  
