
install.packages("dplyr")
library(dplyr)

if(!dir.exists("./data")){ 
    dir.create("./data")
}

dataset_archive <- "./data/UCI_HAR_Dataset.zip"
if(!file.exists(dataset_archive)){
    download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = dataset_archive)
    unzip(zipfile = dataset_archive, exdir = "./data/")    
}

# Read test data set
test_ds_X <- read.table(file = "./data/UCI HAR Dataset/test/X_test.txt")
test_ds_y <- read.table(file = "./data/UCI HAR Dataset/test/y_test.txt")
test_ds_subject <- read.table(file = "./data/UCI HAR Dataset/test/subject_test.txt")
test_ds <- cbind(test_ds_X, test_ds_y, test_ds_subject)

# Read train data set
train_ds_X <- read.table(file = "./data/UCI HAR Dataset/train/X_train.txt")
train_ds_y <- read.table(file = "./data/UCI HAR Dataset/train/y_train.txt")
train_ds_subject <- read.table(file = "./data/UCI HAR Dataset/train/subject_train.txt")
train_ds <- cbind(train_ds_X, train_ds_y, train_ds_subject)

# Read features' names and activity labels
features <- read.table(file="./data/UCI HAR Dataset/features.txt", sep=" ", stringsAsFactors = F)
labels <- c(as.vector(features$V2), "Activity", "Subject")
activities <- read.table(file="./data//UCI HAR Dataset/activity_labels.txt", sep=" ", stringsAsFactors = F)

# Step 1: Merges the training and the test sets to create one data set
full_ds <- rbind(train_ds, test_ds)
names(full_ds) <- labels

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
labels <- labels[grep("(mean\\(|std\\()|Activity|Subject", labels)]
full_ds <- full_ds[labels]

# Step 3,4: Uses descriptive activity names to name the activities in the data set
full_ds <- merge(full_ds, activities, by.x="Activity", by.y ="V1")
full_ds$Activity <- full_ds$V2
full_ds <- subset(full_ds, select = -c(V2))
write.table(full_ds, file = "step4_data.table")

# Step 5: Creates independent tidy data set with the average of each variable for each activity and each subject
grouped_means <- full_ds %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))
write.table(grouped_means, file = "step5_data.table", row.names = F)
