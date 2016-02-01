# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate collecting, working with, and cleaning a data set.  It uses techniques learned in the "Getting and Cleaning Data" course on Coursera.

The required input data for the project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

### run_analysis.R

The script performs the following:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each feature.
- Replaces integers representing activities with descriptive activity names in the data set.
- Appropriately labels the data set with descriptive variable names.
- Creates a tidy data set with the average of each variable for each activity and each subject.

*Note: Before executing the run_analysis.R script, the data zipfile must be downloaded and unzipped in the R working directory.*