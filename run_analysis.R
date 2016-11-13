

# Reading data from UCI HAR Data file.

# reading training data from train file
training <- read.csv("train/X_train.txt", sep="", header=F)
training[, 562] <- read.csv("train/y_train.txt", sep="", header=F)
training[, 563] <- read.csv("train/subject_train.txt", sep="", header=F)

# reading testing data from test file
testing <- read.csv("test/X_test.txt", sep = "", header = F)
testing[,562] <- read.csv("test/y_test.txt", sep = "", header = F)
testing[, 563] <- read.csv("test/subject_test.txt", sep = "", header = F)
 # merge the train & test data in one data

mergeData <- rbind(training, testing)

# reading activityLables data from activity_lables text file

activityLables <- read.csv("activity_labels.txt", sep = "", header = F)

# reading features from features text file

features <- read.csv("features.txt", sep = "", header = F)

# get the data on mean and sd.

mean_sd <- grep(".*-mean.* | .*-std*", features)

features <- features[mean_sd,]

# add new coloums (activity & subject)
colnames(mergeData) <- c(features$v2, "activity", "subject")
mergeData$activity <- as.factor(mergerData)

mergeData$activity <- as.factor(mergeData$activity)
mergeData$subject <- as.factor(mergeData$subject)

# independent tidy data set with the average of each variable for each activity and each subject.

new_tidy <- aggregate(mergeData, by = list(activity = mergeData$activity, subject = mergeData$subject), mean)

