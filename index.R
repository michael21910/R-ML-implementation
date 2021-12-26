# install packages if you haven't
# install.packages("rpart")
# install.packages("rattle")
# install.packages("RColorBrewer")
# install.packages("rpart.plot")

library(rpart)
library(rattle)
library(RColorBrewer)
library(rpart.plot)

# put the csv file here
getwd()

#############################################################################################

### Supervised learning - Decision Tree ###

decisionTreeDataset <- read.csv("decisionTreeDataset.csv", header = T, sep = ",")
decisionTreeDataset

decisionTree <- rpart(
    決定 ~ 城市規模 + 平均收入 + 教育程度 + 當地投資者,
    data = decisionTreeDataset,
    method = "class",
    control = rpart.control(minsplit = 0)
)

plot(decisionTree)
text(decisionTree)
fancyRpartPlot(decisionTree)

#############################################################################################

### Unsupervised learning - KMeans ###

KMeansDataset <- read.csv("KMeansDataset.csv", header = T, sep = ",")
KMeansDataset

KMeans <- kmeans(KMeansDataset, centers = 3, nstart = 10)
KMeans

plot(formula = 購買總價 ~ 客戶, data = KMeansDataset, col = KMeans$cluster, pch = 16)
points(KMeans $center[, c("客戶", "購買總價")], col = 1:3, pch = 24, cex = 1.5)

#############################################################################################

### Supervised learning - Decision Tree Practice ###

decisionTreeDatasetPractice <- read.csv("decisionTreeDatasetPractice.csv", header = T, sep = ",")
decisionTreeDatasetPractice

decisionTreePractice <- rpart(
    Medicine ~ Age + BloodPressure,
    data = decisionTreeDatasetPractice,
    method = "class",
    control = rpart.control(minsplit = 0)
)

plot(decisionTreePractice)
text(decisionTreePractice)
fancyRpartPlot(decisionTreePractice)

#############################################################################################

### Unsupervised learning - KMeans Practice ###

KMeansDatasetPractice <- read.csv("KMeansDatasetPractice.csv", header = T, sep = ",")
KMeansDatasetPractice$ID <- NULL

KMeansPractice <- kmeans(KMeansDatasetPractice , centers = 3, nstart = 10)
KMeansPractice 

plot(formula = Weight ~ Height, data = KMeansDatasetPractice , col = KMeansPractice $cluster, pch = 16)
points(KMeansPractice $center[, c("Height", "Weight")], col = 1:3, pch = 24, cex = 1.5)

#############################################################################################

