#Polynomial Regression

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

#Fitting the Linear Regression to the dataset
lin_reg = lm(formula = Salary ~ ., 
             data = dataset)

#Fitting the Polynomial Regression model to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4 #degrees in Python
poly_reg = lm(formula = Salary ~ ., 
              data = dataset)
#Visualising the Linear Regression results
library(ggplot2)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary), 
             colour = "blue") + 
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)), 
            colour = "red") +
  ggtitle("Truth or Bluff? (Linear)") +
  xlab("Levels") +
  ylab("Salary")

#Visualising the Polynomial Regression results
library(ggplot2)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary), 
             colour = "blue") + 
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)), 
            colour = "red") +
  ggtitle("Truth or Bluff? (Polynomial)") +
  xlab("Levels") +
  ylab("Salary")

#Predicting Salary using user input values(Linear)
y_hat = predict(lin_reg, data.frame(Level = 6.5))

#Predicting Salary using user input values(Polynomial)
y_hat = predict(poly_reg, data.frame(Level = 6.5, 
                                     Level2 = 6.5^2, 
                                     Level3 = 6.5^3,
                                     Level4 = 6.5^4))
