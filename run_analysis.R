library(plyr)

filename <- "./data/getdataDataset.zip"

FileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

getwd()
if (!file.exists("data")) {
  dir.create("data")
}
list.files()

## Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
dateDownloaded <- date()
dateDownloaded

if (file.exists(filename)) { 
  unzip(filename, exdir = "data")
}

# Step 1 - Merge the training and test sets to create one data set
##################################################################

xTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

xTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# create one dataset for x
xDataset <- rbind(xTrain, xTest)

# create one dataset for y
yDataset <- rbind(yTrain, yTest)

# create one dataset for subject
subjectDataset <- rbind(subjectTrain, subjectTest)

# Step 2 - Extract only the measurements on the mean and standard deviation for 
# each measurement
################################################################################################

features <- read.table("./data/UCI HAR Dataset/features.txt")

# Extract only columns with mean() or std() in their names
meanAndStdFeatures <- grep("-(mean|std)\\(\\)", features[, 2])

# Extract only mean and std columns
xDataset <- xDataset[, meanAndStdFeatures]

# update the columns using mean and std features
names(xDataset) <- features[meanAndStdFeatures, 2]

# Step 3 - Use descriptive activity names to name the activities in the data set 
###############################################################################

activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

# update values with appropriate activity names
yDataset[, 1] <- activities[yDataset[, 1], 2]

# update column name
names(yDataset) <- "activity"

# Step 4 - Appropriately label the data set with descriptive variable names
###############################################################################

# update column name
names(subjectDataset) <- "subject"

# combine all the data into a single data set
combineDatasets <- cbind(xDataset, yDataset, subjectDataset)

# Step 5 - Create a second, independent tidy data set with the average of each 
# variable for each activity and subject
###############################################################################

averagesEachActandSubVar <- ddply(combineDatasets, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averagesEachActandSubVar, "Tidy.txt", row.name=FALSE)
