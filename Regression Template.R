#Regression Template

#Importing the dataset
dataset = read.csv("Position_Salaries.csv")
dataset = dataset[2:3]

#Splitting the data into Training and Test set
#install.packages("caTools")
#library(caTools)
#set.seed(123)
#split = sample.split(dataset$Purchased, SplitRatio = .8)
#training_set = subset(dataset, split == TRUE)
#test_set = subset(dataset, split == FALSE)

#Feature Scaling
#training_set[, 2:3] = scale(training_set[, 2:3])
#test_set[, 2:3] = scale(test_set[, 2:3])

#Fitting the Polynomial Regression model to the dataset
#Create Regressor Here

#Predicting Salary using user input values
y_hat = predict(regressor, data.frame(Level = 6.5))

#Visualising the Regression Model results
#install.packages("ggplot2")
library(ggplot2)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary), 
             colour = "blue") + 
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)), 
            colour = "red") +
  ggtitle("") +
  xlab("") +
  ylab("")

#Visualising the Regression Model results (smoother curve/better quality)
#install.packages("ggplot2")
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary), 
             colour = "blue") + 
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))), 
            colour = "red") +
  ggtitle("") +
  xlab("") +
  ylab("")
