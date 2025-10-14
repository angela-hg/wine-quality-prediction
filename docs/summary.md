# Project Summary

### Objective
Determine whether physicochemical properties of wine can predict its quality score using machine learning models.

### Data
- Combined red and white Portuguese *Vinho Verde* datasets  
- 6,497 samples, 13 variables (12 numeric, 1 categorical)

### Models Tested
1. Ridge Regression  
2. Lasso Regression  
3. Elastic Net  
4. CART  
5. Random Forest  
6. Neural Network  

### Results
- **Random Forest** achieved the best performance (R² = 0.537, RMSE = 0.608)  
- **Elastic Net** explained 30.3% of variance (R² = 0.303)

### Insights
- Alcohol and citric acid increase quality.
- Volatile acidity and density decrease quality.
- Random Forest captured non-linear patterns better than linear models.

### Conclusion
Chemical properties can explain about half of wine quality variation, supporting the use of objective measurements for quality control.
