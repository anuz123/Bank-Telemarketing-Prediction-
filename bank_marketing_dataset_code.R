setwd("D:/machine_learning/uci")

# Reading the Train and Test data
bank_train<- read.csv("bank_train.csv",stringsAsFactors = F)
str(bank_train)
table(bank_train$y)
prop.table(table(bank_train$y))
bank_test<- read.csv("bank_test.csv",stringsAsFactors = F)
table(is.na(bank_train))
bank_train<- bank_train[,c("month","duration","previous","y")]



# Using Support Vector Machine (SVM) 
library(kernlab)
bank_classifier<- ksvm(y~.,data=bank_train,kernel="vanilladot")
bank_classifier
bank_predictions<- predict(bank_classifier,bank_test[-21])
bank_predictions
table(bank_predictions,bank_test$y)
agreement<- bank_predictions == bank_test$y
table(agreement)
prop.table(table(agreement))



# Improving the Model Performance
bank_classifier<- ksvm(y~.,data=bank_train,kernel="rbfdot")
bank_classifier
bank_predictions<- predict(bank_classifier,bank_test[-21])
bank_predictions
table(bank_predictions,bank_test$y)
agreement<- letter_predictions == letters_test$letter
table(agreement)
prop.table(table(agreement))

