#set working directory
#download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#load tables into R

train<-read.table("./project/train/X_train.txt")
trainlabel<-read.table("./project/train/y_train.txt")
trainsub<-read.table("./project/train/subject_train.txt")

test<-read.table("./project/test/X_test.txt")
testlabel<-read.table("./project/test/y_test.txt")
testsub<-read.table("./project/test/subject_test.txt")

#merge training and test data sets into 1 data set for all 3 data sets

xdata<-rbind(train,test)
label<-rbind(trainlabel,testlabel)
sub<-rbind(trainsub,testsub)

#extract only the mean and standard deviation for each measurement
#load features dataset

features<-read.table("./project/features.txt")

#use regular expression to get mean and std in the column names

mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

#subset xdata to get the desired mean and std columns from  above

xdata2<-xdata[,mean_and_std_features]

#get column names

names(xdata2) <-features [mean_and_std_features,2]

#use descriptive activity names to name the activities in the data

#load activity label dataset

activity<-read.table("./project/activity_labels.txt")

#update label dataset with correct activity name

label[,1]<-activity[label[,1],2]

#correct column name for label dataset

names(label)<-"activity"

#appropriately label dataset with descriptive variable name

#correct column name for sub dataset

names(sub)<-"subject"

#merge all data together- cbind

all_data<-cbind(xdata2,label,sub)

#write all_data out into .txt file

write.table(all_data, "./project/all_data.txt", row.name=FALSE)

#get a tidy data set with the average of each variable for each activity and each subject. activity and subject in cols 67 and 68 are ignored

tidy_data<- ddply(all_data,.(activity,subject), function(x) colMeans(x[,1:66]))

#write tidy_data out into .txt file

write.table(tidy_data,"./project/tidy_data.txt", row.name=FALSE )



