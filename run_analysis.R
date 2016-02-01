## this script assumes the contents of the data zip file (getdata-projectfiles-UCI HAR Dataset.zip)
## have been unzipped in the current working directory
library(reshape2)

# load the feature dictionary and the list of column names (activity labels) for the data set
features <- read.table('UCI HAR Dataset/features.txt', header=FALSE, stringsAsFactors=FALSE)
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt', header=FALSE, stringsAsFactors=FALSE)

# load each of the three datasets for both the test and training data
x_test <- read.table('UCI HAR Dataset/test/X_test.txt', header=FALSE)
y_test <- read.table('UCI HAR Dataset/test/y_test.txt', header=FALSE)
sub_test <- read.table('UCI HAR Dataset/test/subject_test.txt', header=FALSE)
x_train <- read.table('UCI HAR Dataset/train/X_train.txt', header=FALSE)
y_train <- read.table('UCI HAR Dataset/train/y_train.txt', header=FALSE)
sub_train <- read.table('UCI HAR Dataset/train/subject_train.txt', header=FALSE)

# combine rows from the similar test and train data sets into a single data set
x_all <- rbind(x_test, x_train)
y_all <- rbind(y_test, y_train)
sub_all <- rbind(sub_test, sub_train)

# select rows from the column names set that are mean and standard deviation values
mean_std_features <- features[grepl("mean\\(\\)|std\\(\\)",features$V2),]
# replace parens in the column names
mean_std_features$V2 <- sub("\\(\\)","",mean_std_features$V2)

# select only the mean and std columns from the feature data set
mean_std_data <- x_all[,mean_std_features$V1]

# replace the integer values in the activity data set with the text values from the labels file
y_all$V1 <- with(activity_labels, V2[match(y_all$V1, V1)])

# update the column heading for each data set
names(mean_std_data) <- mean_std_features$V2
names(y_all) <- c('activity')
names(sub_all) <- c('subject')

# merge the columns from all three combined data sets
all_data <- cbind(sub_all, y_all, mean_std_data)

# melt the data to individual feature observations by subject and activity
all_data_melted <- melt(all_data, id.vars=c("subject", "activity"))

# create a table with averages of all the features by activity for a given subject
feature_means_by_subject_activity <- dcast(melted, subject+activity ~ variable, fun.aggregate=mean)

# write the new tidy data set to a file
write.table(feature_means_by_subject_activity, file="FeatureMeans.txt", append=FALSE, row.names=FALSE)
