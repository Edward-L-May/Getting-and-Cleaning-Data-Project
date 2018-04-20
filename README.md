---
title: "README.md"
author: "Edward May"
date: "April 20, 2018"
output: html_document
---

## Getting and Cleaning Data Course Project

This is a project to tidy the data from the

___________________________________________

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Attribution and License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

____________________________________________

The files included in this repo are:

>README.md

>run_analysis.R

>EdwardLMay-CourseProject.Rmd

>EdwardLMay-CourseProject.html

>CodeBook.md

The run_analysis.R script must be loaded into a directory called "UCI HAR Dataset"
that was unzipped from the zip file found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

when sourced, run_analysis.R will generate two files according to the instructions:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.

            This data set is a data.table called "all"
            
5. From the data set in step 4, creates a second, independent tidy data set with the average
    of each variable for each activity and each subject.
    
            This data set is a data.table called "final"

The CodeBook.md describes the variables, the data, and any transformations or work that was performed to clean up the data in each dataset, "all", and "final".

EdwardLMay-CourseProject.Rmd is an R-Markdown file that documents the run_analysis.R file and prints some of the intermediate steps and EdwardLMay-CourseProject.html is the knitted product from that markdown file.

