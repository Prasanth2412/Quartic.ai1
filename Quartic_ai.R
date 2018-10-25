setwd("E:\\Prasanth_R\\new")

# launching necessary libraries
library(readxl)
library(ggplot2)
library(Information)
library(Metrics)
library(Epi)
library(caret)

# loading test & train datasets
train=read.csv("E:\\Prasanth_R\\Quartic_ai\\ds_data\\data_train.csv")
test=read.csv("E:\\Prasanth_R\\Quartic_ai\\ds_data\\data_test.csv")

# adding "target"column to the test data, then combine train & test to pre-process the variables 

test$target="NA"
names(test)[58]="target"
test$target=as.numeric(test$target)

data=rbind(train,test)

summary(data)

# Variables selected for model building based on the summary of the data
# analysing varibles 

# num1
summary(data$num1)
table(is.na(data$num1))
boxplot(data$num1)

ggplot(data, aes(data$target,data$num1))+geom_count()

# num2

summary(data$num2)
table(is.na(data$num2))
boxplot(data$num2)

ggplot(data, aes(data$target,data$num2))+geom_count()


# num3
summary(data$num3)

table(is.na(data$num3))
boxplot(data$num3)

ggplot(data, aes(data$target,data$num3))+geom_count()


# num4
summary(data$num4)
table(is.na(data$num4))

boxplot(data$num4)
ggplot(data, aes(data$target,data$num4))+geom_count()

# num12
summary(data$num12)
table(is.na(data$num12))
boxplot(data$num12)

ggplot(data, aes(data$target,data$num12))+geom_count()

# num14

summary(data$num14)
table(is.na(data$num14))

boxplot(data$num14)
ggplot(data, aes(data$target,data$num14))+geom_count()

# num17
summary(data$num17)
table(is.na(data$num17))
boxplot(data$num17)

ggplot(data, aes(data$target,data$num17))+geom_count()

# num18

summary(data$num18)
table(is.na(data$num18))
data$num18[is.na(data$num18)]=mean(data$num18, na.rm=T)

boxplot(data$num18)
x=1.00156+1.5*IQR(data$num18)
data$num18[data$num18 > x]=x

# After outlier treatment

boxplot(data$num18)

ggplot(data, aes(data$target,data$num18))+geom_count()


# num19
summary(data$num19)
table(is.na(data$num19))
data$num19[is.na(data$num19)]=3

table(data$num19)
data$num19[data$num19 < 1]= 3

boxplot(data$num19)

ggplot(data, aes(data$target,data$num19))+geom_count()

# num20

summary(data$num20)
table(is.na(data$num20))
data$num20[is.na(data$num20)]=mean(data$num20,na.rm=T)

boxplot(data$num20)
x=0.4+1.5*IQR(data$num20)
data$num20[data$num20>x]=x

# after treatment
boxplot(data$num20)

ggplot(data, aes(data$target,data$num20))+geom_count()


# num21
summary(data$num21)
table(is.na(data$num21))

boxplot(data$num21)

x=0.9061+1.5*IQR(data$num21)

data$num21[data$num21>x]=2

# after treatment
boxplot(data$num21)

ggplot(data, aes(data$target,data$num21))+geom_count()


# num23

summary(data$num23)
table(is.na(data$num23))

boxplot(data$num23)

table(data$num23)

data$num23[data$num23<2]=3

# after changig the minimum values
boxplot(data$num23)

ggplot(data, aes(data$target,data$num23))+geom_count()


# der6
summary(data$der6)
table(is.na(data$der6))
boxplot(data$der6)

table(data$der6)

data$der6[data$der6<7]=7

# after changig the minimum values
boxplot(data$der6)

ggplot(data, aes(data$target,data$der6))+geom_count()


# der7
summary(data$der7)
table(is.na(data$der7))

boxplot(data$der7)

ggplot(data, aes(data$target,data$der7))+geom_count()

# der8
summary(data$der8)
table(is.na(data$der8))
boxplot(data$der8)

ggplot(data, aes(data$target,data$der8))+geom_count()

# der9

summary(data$der9)
table(is.na(data$der9))
boxplot(data$der9)

ggplot(data, aes(data$target,data$der9))+geom_count()

# der10
summary(data$der10)
table(is.na(data$der10))

boxplot(data$der10)

ggplot(data, aes(data$target,data$der10))+geom_count()

# der11

summary(data$der11)
table(is.na(data$der11))

boxplot(data$der11)

x=7+1.5*IQR(data$der11)

data$der11[data$der11>x]=x

# After treatment
boxplot(data$der11)

ggplot(data, aes(data$target,data$der11))+geom_count()

# der14
summary(data$der14)
table(is.na(data$der14))
boxplot(data$der14)

x=9+1.5*IQR(data$der14)

data$der14[data$der14>x]=x
# After treatment
boxplot(data$der14)

ggplot(data, aes(data$target,data$der14))+geom_count()

# cat1

summary(data$cat1)
table(is.na(data$cat1))
data$cat1[is.na(data$cat1)]=mean(data$cat1, na.rm=T)

boxplot(data$cat1)

ggplot(data, aes(data$target,data$cat1))+geom_count()

# cat3

summary(data$cat3)
table(is.na(data$cat3))

data$cat3[is.na(data$cat3)]=mean(data$cat3,na.rm=T)

boxplot(data$cat3)

ggplot(data, aes(data$target,data$cat3))+geom_count()

# cat4

summary(data$cat4)
data$cat4[is.na(data$cat4)]=mean(data$cat4,na.rm=T)

boxplot(data$cat4)

data$cat4[data$cat4<3]=3

ggplot(data, aes(data$target,data$cat4))+geom_count()

# cat9

summary(data$cat9)

boxplot(data$cat9)

ggplot(data, aes(data$target,data$cat9))+geom_count()

# cat12
summary(data$cat12)
data$cat12[is.na(data$cat12)]=mean(data$cat12,na.rm=T)

boxplot(data$cat12)

ggplot(data, aes(data$target,data$cat12))+geom_count()

# cat14

summary(data$cat14)
table(data$cat14)
boxplot(data$cat14)

ggplot(data, aes(data$target,data$cat14))+geom_count()


# data Split
train1=data[1:nrow(train),]
test1=data[is.na(data$target),]

# spliting train1 to create Validation data for model perfomance
ind=sample(1:nrow(train1),floor(0.85*nrow(train1)),replace=F)
train2=train1[ind,]
val=train1[-ind,]


# variable significance

IV=create_infotables(train2,y="target")
IV$Summary
options(scipen=999)
# based on the IV table the below variables are strong predictor with values > 0.3
# num21,num17,num20,num18,num3,num14

# building a logistic regression model (m1) based on IV data

m1=glm(data=train2,as.factor(target)~num21+num17+num20+num18+num3+num14, family="binomial")

summary(m1)

# second model built using the variables with the IV 0.3 & 0.2
m2=glm(data=train2, as.factor(target)~num21+num17+num20+cat3+num18+num3+num4+num14+cat10+num2+cat6+num23, family="binomial")
summary(m2)

# Prediction on validation data using both m1 & m2
str(val$target)
predicted_value=predict(m1,val[,c("num21","num17","num20","num18","num3","num14")],type="response")

predicted_value1=predict(m2,val[,c("num21","num17","num18","num20","cat3","num3","num14","num4","cat10","num2","cat6","num23")],type="response")

# Checking the AUC for both
auc(val$target,predicted_value)
auc(val$target,predicted_value1)


# m1 seems to be good mdel comparing the Std error, pvalues, residual & null deviance,AIC & Auc

# ROC for the predicted_value & VAl$target

ROC(val$target,predicted_value)


# testing the proability of the predicted_status, and giving the threshold value to 0.5 to predict the absolute target
check=ifelse(predicted_value>0.5,1,0)
table(is.na(check))

# Confusion matrix

val$target=as.numeric(val$target)
check=as.numeric(check)

# changinging the target variable & check to factors to see the confusion matrix

val$target=as.factor(val$target)
check=as.factor(check)


confusionMatrix(check,val$target,positive = "1")


# predicting the target in the test data

predicted_value2=predict(m1,test1[,c("num21","num17","num20","num18","num3","num14")],type="response")
Predicted_value=ifelse(predicted_value2>0.5,1,0)

# delete the column in test1

test1$target=NULL


# Finally to the Loan Prediction....!!!!

Target_prediction=data.frame("Id"=test1$id, "Target"=Predicted_value, stringsAsFactors = F)

write.csv(Target_prediction, "Target prediction.csv",row.names = F)
# _____________________________________________________________________________________________________________________