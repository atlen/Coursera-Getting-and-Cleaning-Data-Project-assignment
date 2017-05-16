# Coursera-Getting-and-Cleaning-Data-Project-assignment
Getting and cleaning data project assignment. The goal is to show ability to download/manipulate the structured data stoed within the zipped archive.
The assignment made by following the assignment information. Below is the quote to get better understanding.
          One of the most exciting areas in all of data science right now is wearable computing - see for example this article . 
          Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
          The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
          A full description is available at the site where the data was obtained:

          http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

          Here are the data for the project:

          https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

          You should create one R script called run_analysis.R that does the following.

          Merges the training and the test sets to create one data set.
          Extracts only the measurements on the mean and standard deviation for each measurement.
          Uses descriptive activity names to name the activities in the data set
          Appropriately labels the data set with descriptive variable names.
          From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
          
R script run_analysis.r contains following major solutions:
    1.Read data from unzipped data set by read.table command.
    2.Merging the data sets(trainings & tests) as well as naming of total table by using rbind and cbind.
    3.Clean up the columns by using grep
    4.Renaming of the variables by using make.names and gsub commands.
    5.Saving data in .txt format by using write.table
    6.Reordering and cumputing mean by using aggregate and colnames accordingly.
    
Result presents R script, input zipped archive and output 2 files (.txt format)    
