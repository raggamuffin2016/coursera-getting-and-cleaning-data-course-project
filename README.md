# coursera-getting-and-cleaning-data-course-project

This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

Download the dataset zip file if it does not already exist in the working directory

Load the x and y training, test, as well as subject data sets

Load features and extract only those columns from the x data set which reflect a mean or standard deviation

Load activity and update y data set with the appropriate activity

Merges test, train and subject datasets

Create a tidy dataset that consists of the average value of each variable for each subject and activity pair.
The output is shown in the file tidy.txt.
