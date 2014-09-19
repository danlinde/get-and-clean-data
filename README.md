## Getting & Cleaning Data


### Course Project


The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.


There is also a code book that describes the variables, the data, and the work that performed to clean up the data called `CodeBook.md`.


### Setup


Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip] 


- Download the data

- Unzip the file which produces a folder called `UCI HAR Dataset`.

- Place the file `run_analysis.R` and the `UCI HAR Dataset` folder in a new folder and set that folder as your working directory.


### Dependencies


The `run_analysis.R` script uses the data.table package. To install this package enter the following command in your console:


```
install.packages("data.table")
```


Output


The result of running the run_analysis.R script is a new file tidy_data.txt. To run the script enter the following command in your console:


```
source("run_analysis.R")
```
