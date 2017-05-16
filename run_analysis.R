##Below the script to fulfill the requirements of Coursera course #3,week #4 Project assignment
##Fistful you need to unzip the archive into your work dirctory by fillow the link.
##  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##The archive contains the number of useless data for that particular case. So below you can find the file names related to the case only.
##Archive downloaded 14th of May 2017 and the script was made basedon its structure. In case of further updates of source data, some parts of the script could not be work properly.

traindata_subj <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE) ##Reading data sets 9tests and trainings) for further manipulations
traindata_X <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
traindata_y <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)

testdata_subj <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
testdata_X <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
testdata_y <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)

varnames <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
merged_subj <- rbind(testdata_subj, traindata_subj) ; names(merged_subj) <- c("subject") ##Merging the data by following the variables order(subject,
merged_y <- rbind(testdata_y, traindata_y)   ; names(merged_y) <- c("activity")          ## activity, main data contain 561 var list). So it is 563 columns in total
merged_X <- rbind(testdata_X, traindata_X)   ; names(merged_X) <- varnames$V2
merged_total<- cbind(merged_subj, merged_y, merged_X)

##Let's clean up the desk before going further.
rm(merged_X);rm(merged_y); rm(merged_subj); rm(testdata_X); rm(testdata_y); rm(testdata_subj); rm(traindata_X)
rm(traindata_y); rm(traindata_subj); rm(varnames)

##Leave the columns which contain mean and standard deviation amounts after activity and subject cells.
cleandata <- merged_total[,grep("[Aa]ctivity|[Ss]ubject|mean|std", colnames(merged_total))]

rm(merged_total) ##Let's clean up again, almost 9M is out from the laptop))

##Renaming of activity data by replacing the initial numeric values with the relaive names. 
cleandata[, 2] <- read.table("UCI HAR Dataset/activity_labels.txt")[cleandata[,2],2]
names(cleandata[,2]) <- "Activity"

##Renaming the columns in order to make the table more clear for first time reader.
names(cleandata) <- make.names(names(cleandata))
names(cleandata) <- gsub('Acc',"Acceleration",names(cleandata))
names(cleandata) <- gsub('GyroJerk',"AngularAcceleration",names(cleandata))
names(cleandata) <- gsub('Gyro',"AngularSpeed",names(cleandata))
names(cleandata) <- gsub('Mag',"Magnitude",names(cleandata))
names(cleandata) <- gsub('^t',"TimeDomain.",names(cleandata))
names(cleandata) <- gsub('^f',"FrequencyDomain.",names(cleandata))
names(cleandata) <- gsub('\\.mean',".Mean",names(cleandata))
names(cleandata) <- gsub('\\.std',".StandardDeviation",names(cleandata))
names(cleandata) <- gsub('Freq\\.',"Frequency.",names(cleandata))
names(cleandata) <- gsub('Freq$',"Frequency",names(cleandata))

##Save the data into the file by using initial data format.
write.table(cleandata, './clean_merged_total.txt', row.names = FALSE)  

##The independent data set contans the average of each variable for each activity and each subject. result is stored as .txt file accordingly.
ave_cleandata <- aggregate(x=cleandata, by=list(activities=cleandata$activity, subj=cleandata$subject), FUN=mean)
ave_cleandata <- ave_cleandata[, !(colnames(ave_cleandata) %in% c("subj", "activity"))]
write.table(ave_cleandata, './ave_cleandata.txt', row.names = FALSE)


##Assignment complete