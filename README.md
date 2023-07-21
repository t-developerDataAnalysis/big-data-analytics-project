# population_data_analytics

# CIND820 - Capstone Project - Results:

##File: modeling_linear_regressions.ipynb

##Population Decline: Set of Data, independent variable: TPopulation1Jan   

## Results using the reduced data set: 


## Multiple Linear Regression
	Not performing well only 6%
R-squared (R2) Score:   0.06279830151164367

## Polynomial Regression Results: R^2 value can range from negative infinity to 1.0,
	 With 4 degrees 
Train R^2: 0.8116244705703749
Test R^2: -766.1889637215305

Only with 2 degrees is showing between 0 to 100%
Train R^2: 0.4140232722825822
Test R^2: 0.39242509155778316
Overfitting
The test with R-Square show the model is  too complex and tries to fit the noise in the data rather than capturing the underlying patterns. In the case of polynomial regression with a high degree (degree=4 in your case), the model may be fitting the noise in the training data too well, leading to poor generalization on unseen data (the test set).

## Random Forest:
In both cases performing well 98 percent and 83%
Random Forest - Train R^2: 0.9855033891660968
Random Forest - Test R^2: 0.8378069954034717

## Gradient Boosting 
	In both cases performing well 92% and 83%
Train R^2: 0.9210088706064007 Gradient Boosting - 
Test R^2: 0.8373266884850991

## Network Regression
	In both cases not performing well 19% and 0.043%
Neural Network Regression - Train R^2: 0.19014501411429263
Neural Network Regression - Test R^2: 0.04398702724690562





Support Vector Regression
In both cases not performing well 0.37% and 0.33%

Train R^2: -0.03718941052874958
Support Vector Regression - Test R^2: -0.03320311845791735
