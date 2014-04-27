TidyData
========
run_analysis.R

Processes Samsung movement data for various activities and subjects and compiles a table of the average of each mean and standard deviation variable for each subject-activity combination.

Inputs:
activity_labels.txt
features.txt
train/subject_train.txt
train/X_train.txt
train/y_train.txt
test/X_test.txt
test/y_test.txt
test/subject_text.txt

run_analysis.R converts each of the input files to an R data frame, combines the training and test data to make one data set, extracts only the measurements containing the mean and standard deviation values for the data set, appends descriptive labels to the activities in the data set, and outputs a file with the average of each measurement variable for each combination of subject and activity.

Outputs:
tidy_data.txt: a comma-separated text file containing the average of each mean and standard deviation movement variable for each subject-activity combination.
