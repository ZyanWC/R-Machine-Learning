#Hierachical Clustering

#Importing the dataset
dataset <- read.csv("Mall_Customers.csv")
x <- dataset[4:5]

#Using the Dendrogram
dendrogram = hclust(dist(x, method = "euclidean"),
                    method = "ward.D2")
plot(dendrogram, 
     main = paste("Dendrogram"), 
     xlab = "Customers", 
     ylab = "Euclidean Distance")

#Fitting the hierachical clustering o the dataset
hc = hclust(dist(x, method = "euclidean"),
           method = "ward.D2")
y_hc = cutree(hc, 5)

#Visualizing the Hierachical Clusters
library(cluster)
clusplot(x, 
         y_hc, 
         lines = 0, 
         shade = TRUE, 
         color = TRUE,
         labels = 2,
         plotchar = FALSE, 
         span = TRUE, 
         main = paste("Clusters of Clients"), 
         xlab = "Annual Income", 
         ylab = "Spending SCore (1-100)")
