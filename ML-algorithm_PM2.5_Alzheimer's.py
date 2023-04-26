import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import r2_score

# Merge the PM2.5 and Alzheimer's mortality rate data by state and year
data = pd.read_csv("regression_plot_data.csv")
print (data)

# Separate the features and target variable
X = data[['pm2.5']]
y = data[['alzheimers_mortality']]

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1, random_state=0)

# Train a linear regression model on the training data
model = LinearRegression()
model.fit(X_train, y_train)

print("X train: ", X_train)
print("y train: ", y_train)

# Make predictions on the testing data
y_pred = model.predict(X_test)

print("Y-pred:", y_pred)

# Evaluate the model performance using R-squared
r2 = r2_score(y_test, y_pred)
print("R-squared:", r2)

# Use the trained model to predict the change in Alzheimer's mortality rate for future PM2.5 levels
future_data = pd.DataFrame({'pm2.5': [5, 10, 15, 20, 25, 30, 35, 40, 45, 50]})
future_predictions = model.predict(future_data)
print("Predicted change in Alzheimer's mortality rate (per 100k people) for PM2.5 levels of 5, 10, 15, 20, 25, 30, 35, 40, 45, 50:")
for i in range(len(future_predictions)):
    print("{:.2f}".format(future_predictions[i][0]))
