# Load libraries
library(data.table)

# Load data into tables
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)

# Appropriately label data with feature names.
names(X_test) <- features[,2]
names(X_train) <- features[,2]

# Extract only measurements on the mean and standard deviation
mean_std_features <- grep("mean|std", features[,2])
X_test_mean_std_only <- X_test[,mean_std_features]
X_train_mean_std_only <- X_train[,mean_std_features]

# Use descriptive activity names
y_test[,2] <- activities[y_test[,1],2]
names(y_test) <- c("Activity_ID", "Activity_Name")

y_train[,2] <- activities[y_train[,1],2]
names(y_train) <- c("Activity_ID", "Activity_Name")

## Subject headers
names(subject_test) <- "Subject_ID"
names(subject_train) <- "Subject_ID"

# Merge the training and the test sets to create one data set
X <- rbind(X_test_mean_std_only, X_train_mean_std_only)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

data <- cbind(X, y, subject)

# Create tidy data set with average of each variable for each activity and each subject
DT <- data.table(data)
tidy <- DT[,lapply(.SD,mean),by="Subject_ID,Activity_Name"]
write.table(tidy, file="./tidy.txt", sep="\t", row.names=FALSE)
