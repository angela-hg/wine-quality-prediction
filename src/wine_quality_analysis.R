# ---------------------------------------------------------------
# 🍷 Wine Quality Prediction
# Author: Angela Herrera
# ---------------------------------------------------------------

# Load required packages
library(caret)
library(ggplot2)
library(corrplot)
library(GGally)
library(glmnet)
library(randomForest)
library(nnet)
library(rpart)

# ---------------------------------------------------------------
# 1. Load Data
# ---------------------------------------------------------------
red_wine <- read.csv("../data/winequality-red.csv", sep = ";")
white_wine <- read.csv("../data/winequality-white.csv", sep = ";")

# Add Type variable
red_wine$Type <- "Red"
white_wine$Type <- "White"

# Merge datasets
wine_data <- rbind(red_wine, white_wine)
wine_data$Type <- as.factor(wine_data$Type)

# ---------------------------------------------------------------
# 2. Exploratory Data Analysis
# ---------------------------------------------------------------
summary(wine_data)
dim(wine_data)
str(wine_data)
sum(is.na(wine_data))

# Boxplots and histograms
par(mfrow=c(3,4))
for (i in 1:(length(wine_data)-1)) {
  boxplot(wine_data[[i]], main = colnames(wine_data)[i])
}
par(mfrow=c(3,4))
for (i in 1:(length(wine_data)-1)) {
  hist(wine_data[[i]], main = colnames(wine_data)[i], xlab = colnames(wine_data)[i])
}

# Correlation heatmap
numeric_vars <- wine_data[, sapply(wine_data, is.numeric)]
corr_matrix <- cor(numeric_vars)
corrplot(corr_matrix, method = "color", type = "upper", tl.col = "black")

# ---------------------------------------------------------------
# 3. Train-Test Split
# ---------------------------------------------------------------
set.seed(123)
train_index <- createDataPartition(wine_data$quality, p = 0.8, list = FALSE)
train_data <- wine_data[train_index, ]
test_data  <- wine_data[-train_index, ]
train_control <- trainControl(method = "cv", number = 5)

# ---------------------------------------------------------------
# 4. Model Training
# ---------------------------------------------------------------
# Ridge
ridge_model <- train(quality ~ ., data = train_data, method = "glmnet",
  trControl = train_control,
  tuneGrid = expand.grid(alpha = 0, lambda = seq(0.01, 0.1, 0.01)))

# Lasso
lasso_model <- train(quality ~ ., data = train_data, method = "glmnet",
  trControl = train_control,
  tuneGrid = expand.grid(alpha = 1, lambda = seq(0.01, 0.1, 0.01)))

# Elastic Net
elastic_model <- train(quality ~ ., data = train_data, method = "glmnet",
  trControl = train_control, tuneLength = 5)

# CART
cart_model <- train(quality ~ ., data = train_data, method = "rpart",
  trControl = train_control, tuneLength = 5)

# Random Forest
rf_model <- train(quality ~ ., data = train_data, method = "rf",
  trControl = train_control, tuneLength = 3)

# Neural Network
nn_model <- train(quality ~ ., data = train_data, method = "nnet",
  trControl = train_control, linout = TRUE, trace = FALSE, tuneLength = 5)

# ---------------------------------------------------------------
# 5. Model Evaluation
# ---------------------------------------------------------------
models_list <- list(
  Ridge = ridge_model, Lasso = lasso_model,
  ElasticNet = elastic_model, CART = cart_model,
  RandomForest = rf_model, NeuralNet = nn_model
)

model_resamps <- resamples(models_list)
summary(model_resamps)
bwplot(model_resamps, metric = "RMSE")
dotplot(model_resamps, metric = "Rsquared")

# Save plots
png("../results/model_comparison.png", width = 900, height = 600)
bwplot(model_resamps, metric = "RMSE")
dev.off()
