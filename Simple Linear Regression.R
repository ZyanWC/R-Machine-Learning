#Simple Linear Regression

#Importing the dataset
dataset = read.csv("Salary_Data.csv")
#dataset = dataset[, 1:]

#Splitting the data into Training and Test set
#install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Feature Scaling
#training_set[, 2:3] = scale(training_set[, 2:3])
#test_set[, 2:3] = scale(test_set[, 2:3])

#Fitting Simple Linear Regression to the training set
regressor = lm(formula = Salary ~ Years.Experience, 
               data = training_set)


#Predicting the Test set
y_hat = predict(regressor, newdata = test_set)

#Visualizing the training set
#install.packages("ggplot2")
library(ggplot2)
ggplot() + 
  geom_point(aes(x = training_set$Years.Experience, y = training_set$Salary),
             colour = "blue") +
  geom_line(aes(x = training_set$Years.Experience, y = predict(regressor, newdata = training_set)),
            colour = "red") +
  ggtitle("Salary vs Experience (Training set)") +
  xlab("Years of Experience") +
  ylab("Salary")

#Visualizing the test set
#install.packages("ggplot2")
library(ggplot2)
ggplot() + 
  geom_point(aes(x = test_set$Years.Experience, y = test_set$Salary),
             colour = "blue") +
  geom_line(aes(x = training_set$Years.Experience, y = predict(regressor, newdata = training_set)),
            colour = "red") +
  ggtitle("Salary vs Experience (Training set)") +
  xlab("Years of Experience") +
  ylab("Salary")