
if(!dir.exists("./data")){ 
    dir.create("./data")
}

dataset_archive <- "./data/UCI_HAR_Dataset.zip"
if(!file.exists(dataset_archive)){
    download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = dataset_archive)
    unzip(zipfile = dataset_archive, exdir = "./data/")    
}


test_ds_X <- read.table(file = "./data/UCI HAR Dataset/test/X_test.txt")
test_ds_y <- read.table(file = "./data/UCI HAR Dataset/test/y_test.txt")
test_ds <- cbind(test_ds_X, test_ds_y)
head(test_ds)

train_ds_X <- read.table(file = "./data/UCI HAR Dataset/train/X_train.txt")
train_ds_y <- read.table(file = "./data/UCI HAR Dataset/train/y_train.txt")
train_ds <- cbind(train_ds_X, train_ds_y)
head(train_ds)

features <- read.table(file="./data/UCI HAR Dataset/features.txt", sep=" ")
activities <- read.table(file="./data//UCI HAR Dataset/activity_labels.txt", sep=" ")

full_ds <- rbind(train_ds, test_ds)

labels <- as.list(features$V2)
head(labels)
head(grep("(mean|std)", labels))





?grep

?print


