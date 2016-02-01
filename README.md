# Getting and Cleaning Data Course Project

The goal of this project is to demonstrate collecting, working with, and cleaning a data set.  It uses techniques learned in the "Getting and Cleaning Data" course on Coursera.

The required input data for the project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The input data contains multiple data sets (test and training) and has variable values split across three text files.  The assignment includes merging the data files, limiting the included features, and finding averages of those features grouped by required id values.

### Description of run_analysis.R

The script performs the following:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each feature.
- Replaces integers representing activities with descriptive activity names in the data set.
- Appropriately labels the data set with descriptive variable names.
- Creates a tidy data set with the average of each variable for each activity and each subject.

### Running run_analysis.R

1. Download the data set zip file linked above.
2. Unzip into the R working directory.
3. Source the run_analysis.R script.

The script will write a file named FeatureMeans.txt containing the new tidy data set.  For details on the contents, see the [Code Book](https://github.com/coderkitchen/GettingAndCleaningDataProject/blob/master/CodeBook.md).