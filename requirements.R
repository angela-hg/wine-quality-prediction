# Install required packages for Wine Quality Prediction project
required_packages <- c(
  "caret", "ggplot2", "corrplot", "GGally", "glmnet", "randomForest", "nnet", "rpart", "rmarkdown"
)

install_if_missing <- function(p) {
  if (!requireNamespace(p, quietly = TRUE)) install.packages(p)
}

invisible(lapply(required_packages, install_if_missing))