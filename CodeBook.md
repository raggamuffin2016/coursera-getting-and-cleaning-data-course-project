Script run_analysis.R

1 - load data set zip file into working directory. Create directory and file, 
    if one does not exist
2 - Step 1, Merge the training and test sets to create one data set 
3 - Create one data set for x from train and test
4 - Create one data set for y from train and test
5 - Create one data set for subject from train and test
6 - Step 2, Extract only the measurements on the mean and standard deviation for 
         each measurement from the features data
7 - Read/load the features data
8 - Extract only columns with mean() or std() in their names from features data
9 - Extract only mean and std columns from the x dataset
10 - Update x data set columns with corresponding mean and std from features data set
11 - Step 3, Use descriptive activity names to name the activities in the data set
12 - Read/load activities data
13 - Update y data set values with appropriate activity names
14 - Rename column name to 'activity'
15 - Step 4, Appropriately label the data set with descriptive variable names
16 - Rename subject data set column name to 'subject'
17 - Combine x, y and subject data sets into a single data set
18 - Step 5, Create a second, independent tidy data set with the average of each 
     variable for each activity and subject
19 - Use plyr library, ddply to calcute the average of each 
     variable for each activity and subject of the combine data set
20 - Write the resulting Tidy.txt output to working directoy