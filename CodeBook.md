## Code Book


### About the Data


Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]


The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone. 


A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]


### Work/Transformations


The following files were loaded:

- X_test.txt
- y_test.txt
- subject_test.txt
- X_train.txt
- y_train.txt
- subject_train.txt
- activity_labels.txt
- features.txt


The feature names as described in `features_info.txt` were added as headers to the `X_test` and `X_train data`.


The `X_test` and `X_train` data was then limited to only measurements on the mean and standard deviation as `X_test_mean_std_only` and `X_train_mean_std_only`.


An additional column with activity names was added to the `y_test` and `y_train` data. Column headers of "Activity_ID" and Activity_Name" were added.

The `subject_test` and `subject_train` data was given a column header of "Subject_ID".


The data was merged into one data set in 4 steps: i) `rbind` of the `X_train_mean_std_only` and `X_test_mean_std_only` data; ii) `rbind` of the `y_train` and `y_test` data; iii) `rbind` of the `subject_train` and `subject_test` data; and finally iv) a `cbind` of the resuling data sets from steps i - iii.


This data was then put into a `data.table` creating a second, independent tidy data set with the average of each variable for each activity and each subject. The new dataset is saved as file with the file name `tidy.txt`.

