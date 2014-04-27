# Load the movement data for both the test and training sets
trainX <- read.table("train/X_train.txt")
testX <- read.table("test/X_test.txt")

# Load the column headings and activity names
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt", col.names = c("labels", "activity"))

# Apply the column headings to the movement data frames
names(trainX) <- features[,2]
names(testX) <- features[,2]

# Combine the test and training datasets for the movement data
trainTestX <- rbind(trainX,testX)

# Load and combine the test and training activity labels
trainY <- read.table("train/y_train.txt", col.names = c("labels"))
testY <- read.table("test/y_test.txt", col.names = c("labels"))
labels <- rbind(trainY,testY)

# Load and combine the test and training subject lists
trainSubj <- read.table("train/subject_train.txt", col.names = c("subject"))
testSubj <- read.table("test/subject_test.txt", col.names = c("subject"))
subjects <- rbind(trainSubj, testSubj)

# Pattern matching to select mean and std deviation terms
meanStd <- grep("mean|std", names(trainTestX))
trainTestXFiltered <- trainTestX[,meanStd]
meanFreq <- grep("meanFreq", names(trainTestXFiltered))
trainTestXFiltered <- trainTestXFiltered[,-meanFreq]

# Add the activity labels and subject labels to the data
trainTestXYFiltered <- cbind(trainTestXFiltered, labels)
trainTestXYSFiltered <- cbind(trainTestXYFiltered, subjects)

# Add the descriptive activity names to the data
filteredXYS <- merge(trainTestXYSFiltered, activities, all = TRUE, sort = FALSE)

# Calculate the average of each variable grouped by subject and activity
dResults <- ddply(filteredXYS, c("subject", "activity"), colwise(mean))

# Export the results to a text file
write.table(dResults, file = "tidy_data.txt", sep = ",", row.names = FALSE)