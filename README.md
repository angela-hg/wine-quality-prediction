# 🍷 Wine Quality Prediction using Machine Learning

This project investigates whether the chemical composition of wine can predict its quality score.  
Using red and white Portuguese *Vinho Verde* datasets, we apply multiple regression and ensemble models to explore this relationship.

---

## 📊 Overview

The dataset contains physicochemical measurements (acidity, sulphates, alcohol, etc.) for red and white wines.  
We train and compare several predictive models, including **Elastic Net Regression** and **Random Forest**, using R.

**Goal:** Predict wine quality objectively using lab-measured features.

---

## ⚙️ Project Structure

wine-quality-prediction/
│
├── data/ # Raw datasets
├── src/ # Scripts and RMarkdown analysis
├── docs/ # Project summary
├── requirements.R # Package installer
└── README.md # This file


---

## 🚀 How to Run

### Clone the repo
```bash
git clone https://github.com/YOUR-USERNAME/wine-quality-prediction.git
setwd("wine-quality-prediction/src")
```

### Install dependencies
```bash
source("../requirements.R")
```

### Run the RMarkdown file
```bash
rmarkdown::render("wine_quality_analysis.Rmd")
```

When rendered, the .Rmd automatically produces a Markdown document (.md) with all results, tables, and figures visible directly on GitHub.

📈 Main Results

| Model         | RMSE      | R²        | MAE       |
| ------------- | --------- | --------- | --------- |
| Elastic Net   | 0.738     | 0.303     | 0.574     |
| Random Forest | **0.608** | **0.537** | **0.439** |


🧩 Dependencies

- caret
- ggplot2
- corrplot
- GGally
- glmnet
- randomForest
- nnet

📚 Reference

Cortez, P. et al. (2009). Wine Quality Dataset.
UCI Machine Learning Repository — https://doi.org/10.24432/C56S3T

🪪 License

Licensed under the MIT License.





