
run_analysis <- function(directory)
{
      ## 'directory' is a character vector of length 1 indicating the location of unzziped UCI HAR dataset.
      ## The directory structure has to remain as original one right after unzziping the files.
  
  
      ##===========================================================================================
      ##
      ##    The script starts with data reading from files into variables
      ##    and checking if appropriate files exist
      ##
      ##===========================================================================================
  
  
      if(!file.exists(directory))  {  stop(paste("The directory: ",directory, " was not found"))   }  
      
      ## Reading Activity labels and storing them in vriable activityLabels
      activitylabels.filename <- paste(directory,"activity_labels.txt", sep ="/")
      if(file.exists(activitylabels.filename))
      {
            activityLabels <- read.table(activitylabels.filename)
            names(activityLabels) <- c("IDX","ACTIVITY_NAME")
      }
      else {  stop(paste("The activity label file: ",activitylabels.filename, " was not found"))   }
      
      
      ## Reading feature labels and storing them in vriable features
      features.filename <- paste(directory,"features.txt", sep ="/")
      if(file.exists(features.filename))
      {
            features <- read.table(features.filename)
            names(features) <- c("IDX","FEATURE_NAME")
      }
      else {   stop(paste("The feature label file: ",features.filename, " was not found"))   }
      
      
      ## Reading training subjects and storing them in vriable train_subjects
      train_subjects.filename <- paste(directory,"train","subject_train.txt", sep ="/")
      if(file.exists(train_subjects.filename))
      {
            train_subjects <- read.table(train_subjects.filename)
            names(train_subjects) <- c("SUBJECT")
      }
      else {   stop(paste("The training subject names file: ", train_subjects.filename, " was not found"))   }
      
      ## Reading testing subjects and storing them in vriable test_subjects
      test_subjects.filename <- paste(directory,"test","subject_test.txt", sep ="/")
      if(file.exists(test_subjects.filename))
      {
            test_subjects <- read.table(test_subjects.filename)
            names(test_subjects) <- c("SUBJECT")
      }
      else {   stop(paste("The testing subject names file: ", test_subjects.filename, " was not found"))   }
  
      
      ## Reading test labels and storing them in vriable test_labels
      test_labels.filename <- paste(directory,"test","y_test.txt", sep ="/")
      if(file.exists(test_labels.filename))
      {
            test_labels <- read.table(test_labels.filename)
            names(test_labels) <- c("ACTIVITY")
      }
      else {   stop(paste("The testing labels file: ",  test_labels.filename, " was not found"))   }
      
      ## Reading train labels and storing them in vriable train_labels
      train_labels.filename <- paste(directory,"train","y_train.txt", sep ="/")
      if(file.exists(train_labels.filename))
      {
            train_labels <- read.table(train_labels.filename)
            names(train_labels) <- c("ACTIVITY")
      }
      else {   stop(paste("The trainning labels file: ", train_labels.filename, " was not found"))   }
      
      
      
      ## Reading training data and storing them in vriable train_Data
      train_Data.filename <- paste(directory,"train","X_train.txt", sep ="/")
      if(file.exists(train_Data.filename))
      {
            train_Data <- read.table(train_Data.filename)
      }
      else {   stop(paste("The training data file: ", train_Data.filename, " was not found"))   }      
      
      ## Reading trest data and storing them in vriable test_Data
      test_Data.filename <- paste(directory,"test","X_test.txt", sep ="/")
      if(file.exists(train_Data.filename))
      {
            test_Data <- read.table(test_Data.filename)
      }
      else {   stop(paste("The testing data file: ", test_Data.filename, " was not found"))   }
      
      
      ##===========================================================================================
      ##
      ##    Starting from here the script starts to form the resulting data set
      ##
      ##===========================================================================================
      
      
      #Binding feature names to data sets
      names(test_Data) <- features$FEATURE_NAME
      names(train_Data) <- features$FEATURE_NAME

      
      #Binding labels and subject to training and testing data sets
      test_Data <- cbind(test_Data,test_subjects)
      test_Data <- cbind(test_Data,test_labels)
      
      train_Data <- cbind(train_Data,train_subjects)
      train_Data <- cbind(train_Data,train_labels)
      
      #Binding test and training data
      data <- rbind(train_Data,test_Data)
      
      #Replacing activity indexes by activity names
      data$ACTIVITY <- activityLabels[data$ACTIVITY,]$ACTIVITY_NAME
      
      #Getting column indexes, which are needed i.e. those that contain mean or std keywords (and activity or subject index)
      cols <- c(grep("std()|mean()|ACTIVITY|SUBJECT",names(data)))
      
      #Extracting only mean and standard deviation columns of the features
      tidy_Data <- data[, cols]
      
      
      #Making the tidy data set for saving in file
      colcount <- length(names(tidy_Data))-2      
      tidy_Data_avg <- aggregate(tidy_Data[, 1:colcount], by = list(tidy_Data$ACTIVITY,tidy_Data$SUBJECT), mean )
      names(tidy_Data_avg)[1:2] = c("ACTIVITY","SUBJECT")
      
      #Saving the tidy data set
      write.table(tidy_Data_avg, file = paste(directory,"tidy_Data_avg.txt", sep ="/"), row.name=FALSE)
}