#Mulitple Linear Regression

#Importing the dataset
dataset = read.csv("50 Startups.csv")
#dataset = dataset[, 2:3]

#Encoding the categorical variable
dataset$State = factor(dataset$State, 
                        levels = c("New York", "California", "Florida"),
                        labels = c(1, 2, 3))
#Splitting the data into Training and Test set
#install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = .8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Feature Scaling
#training_set[, 2:3] = scale(training_set[, 2:3])
#test_set[, 2:3] = scale(test_set[, 2:3])

#Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ ., 
               data = training_set)

#Predicting the Test sert results
y_hat = predict(regressor, newdata = test_set)

#Building the optimal model using Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, 
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, 
               data = dataset)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend, 
               data = dataset)
summary(regressor)

#If you wanna be thorough on the 5%
#regressor = lm(formula = Profit ~ R.D.Spend, 
#               data = dataset)
#summary(regressor)