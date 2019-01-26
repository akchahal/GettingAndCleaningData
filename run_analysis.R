 #--------------------------------------------------------------------------------  
  ## set the working directory and downlod the data files 
  setwd('g:/coursera/assignment')
  if(!file.exists("data")){
  dir.create("data")
  }
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  zipFile <- "./data/dataset.zip"
  download.file(fileUrl,destfile = zipFile)
  
  ## unzip dataset to 'data' directory
  unzip(zipfile= zipFilePath,exdir="./data")
  
  ## list the files in this folder
  list.files('./data')
  ##  [1] "dataset.zip"     "UCI HAR Dataset"
  
  ## set 'data' as working directory
  setwd('g:/coursera/assignment/data')
  #--------------------------------------------------------------------------------  
  # Step 1. MERGE DATA
  ## load train and test datasets
  trainX <- read.table("UCI HAR Dataset/train/X_train.txt")
  trainY <- read.table("UCI HAR Dataset/train/Y_train.txt")
  trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
  
  testX <- read.table("UCI HAR Dataset/test/X_test.txt")
  testY <- read.table("UCI HAR Dataset/test/Y_test.txt")
  testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
  
  ## load Activity and Features data
  activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
  features <- read.table("UCI Har Dataset/features.txt")
  
  ##Add column names to test and rain datasets
  colnames(trainX) <- features[,2]
  colnames(trainY) <- "activityId"
  colnames(trainSubject) <- "subjectId"
  
  colnames(testX) <- features[,2]
  colnames(testY) <- "activityId"
  colnames(testSubject) <- "subjectId"
  
  colnames(activityLabels) <- c('activityId','activityType')
  
  ##Do column bind for train datasets and for test datasets individually
  trainData <- cbind(trainY, trainSubject, trainX)
  testData <- cbind(testY, testSubject, testX)
  ##Now row bind these 2 datasets to get the merged dataset
  mergedData <- rbind(trainData, testData)
  
  ##dim(setAllInOne)
  ##[1] 10299   563
  
  #--------------------------------------------------------------------------------  
  #Step 2. Extracting only the measurements on the mean and standard deviation for each measurement
  ## read all column names
  columnNames <- colnames(mergedData)
  
  ## get column names with mean , std pattern match
  columnsRequired <- (grepl("activityId",columnNames) | grepl("subjectId",columnNames) | grepl("mean..",columnNames) | grepl("std..",columnNames))
  
  ## get only the mean and std columns and create a subset
  mergedDataset <- mergedData[,columnsRequired == TRUE]
  ## dim(mergedDataset)
  ##[1] 10299    81
  
  #--------------------------------------------------------------------------------  
  # Step 3.Uses descriptive activity names to name the activities in the data set
  # get activities & subjects factors
  mergedDataset$activityId <- factor(mergedDataset$activityId, levels = activityLabels[,1], labels = activityLabels[,2])
  mergedDataset$subjectId <- as.factor(mergedDataset$subjectId)

  #--------------------------------------------------------------------------------  
  # Step 4.Appropriately labels the data set with descriptive variable names.
  #Already done in the above steps
 
  #--------------------------------------------------------------------------------   
  # Step 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  ## download the tidy dataset in current working directory
 
  library(reshape2)
  meltedData <- melt(mergedDataset, id = c("subjectId", "activityId"))
  tidyData <- dcast(meltedData, subjectId + activityId ~ variable, mean)
  write.table(tidyData, "tidy.txt", row.names = FALSE, quote = FALSE)
  
  ##dim(mergedDataset)
  ##[1] 180    81
  