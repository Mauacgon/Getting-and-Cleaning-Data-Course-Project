                #Install packages data.table, tidyr, dplyr and reshape if they are not already installed and load them.

packages <- c("data.table", "dplyr", "tidyr", "reshape2")
for (i in packages) {
  if (is.na(match(i, rownames(installed.packages()))) == TRUE )  { 
    install.packages(i)
  }
}

lapply(packages, library, character.only = TRUE)

                #Download the dataset if it does not already exist in the working directory.

zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

if (!file.exists(zipFile)) {
  download.file(zipUrl, zipFile, mode = "wb")
}

dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
  unzip(zipFile)
}

                #Load all the train and test info contained in the dataset

features <- fread("UCI HAR Dataset/features.txt", sep = " ")
testdata <- fread("UCI HAR Dataset/test/X_test.txt")
testlbls <- fread("UCI HAR Dataset/test/y_test.txt")
trainsbj <- fread("UCI HAR Dataset/train/subject_train.txt")
traindata <- fread("UCI HAR Dataset/train/X_train.txt")
trainlbls <- fread("UCI HAR Dataset/train/y_train.txt")
testsbj <- fread("UCI HAR Dataset/test/subject_test.txt")

              #Label train and test data, giving them the right variable names and merge both into a single dataframe.

names(testdata) <- unlist(features[,2])
names(traindata) <- unlist(features[,2])


testdata$activity <- testlbls
traindata$activity <- trainlbls
testdata$subject <- testsbj
traindata$subject <- trainsbj
trainandtest <- rbind(testdata, traindata)

              #Keep only the variables which figures out a mean or a standard deviation. Discard the others.

selectnumbersvector <- grep("[ms][et][ad]", names(trainandtest), value = TRUE)
trainandtestmeansd <- trainandtest[,c(selectnumbersvector, "activity", "subject"), with = FALSE]

              #Correctly label activity variable with its right descriptive names.

activities <- setNames(seq(6), c("WALKING", "WALKING_UPSTARIS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
activitiesvector <- activities[trainandtestmeansd$activity]
trainandtestmeansd$activity <- names(activitiesvector)

              #Sort column names, putting activity and subject variables into the first columns place.

trainandtestmeansd <- select(trainandtestmeansd, activity, subject, 1:(ncol(trainandtestmeansd)-2))

              #Label data with the appropriate descriptive names of the variables.

namesofvars <- names(trainandtestmeansd)


namesofvars <- gsub("BodyBody", "Body", namesofvars)
namesofvars <- gsub("mean", "Mean", namesofvars)
namesofvars <- gsub("std", "StandardDeviation", namesofvars)
namesofvars <- gsub("Acc", "Accelerometer", namesofvars)
namesofvars <- gsub("Gyro", "Gyroscope", namesofvars)
namesofvars <- gsub("Mag", "Magnitude", namesofvars)
namesofvars <- gsub("Freq", "Frequency", namesofvars)
namesofvars <- gsub("^f", "frequencyDomain", namesofvars)
namesofvars <- gsub("^t", "timeDomain", namesofvars)
namesofvars <- gsub("[\\(\\)-]", "", namesofvars)

colnames(trainandtestmeansd) <- namesofvars

              #Convert subject and activty vars. into factors.

trainandtestmeansd$subject <- as.factor(trainandtestmeansd$subject)
trainandtestmeansd$activity <- as.factor(trainandtestmeansd$activity)

              #Group dataset by activity and subject and create the final dataset summarizing all variables into 
              #its mean by subject and activity.

trainandtestmeansd <- arrange(trainandtestmeansd, subject, desc(activity))
trainandtestmeansdgr <- group_by(trainandtestmeansd, subject, activity)
final_data <- summarise_each(trainandtestmeansdgr, funs(mean))

              #Write a table with the final dataset.

write.table(final_data, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)
