import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report
from sklearn.preprocessing import OneHotEncoder
from imblearn.over_sampling import RandomOverSampler
import numpy as np
import pickle

# Read the CSV file
df = pd.read_csv("chrun_dataset.csv")

# Convert column names to strings
df.columns = df.columns.astype(str)

# Convert categorical variables into dummy/indicator variables (one-hot encoding)
encoder = OneHotEncoder(drop='first')
encoded_df = pd.DataFrame(encoder.fit_transform(df[['gender', 'location', 'plan_type']]).toarray())
df.drop(['gender', 'location', 'plan_type'], axis=1, inplace=True)
df = pd.concat([df, encoded_df], axis=1)

# Separate independent and dependent variables
x = df.drop('churn_status', axis=1)  # Independent features
y = df['churn_status']  # Dependent feature

# Convert x to NumPy array
x_array = np.array(x)

# Handling Imbalanced Data (if applicable)
ros = RandomOverSampler(random_state=42)
x_resampled, y_resampled = ros.fit_resample(x_array, y)

# Split the dataset into training and testing
x_train, x_test, y_train, y_test = train_test_split(x_resampled, y_resampled, test_size=0.2, random_state=42)

# Model Training
model = RandomForestClassifier()
model.fit(x_train, y_train)

# Making Predictions
y_pred = model.predict(x_test)

# Evaluating the Model
accuracy = accuracy_score(y_test, y_pred)
conf_matrix = confusion_matrix(y_test, y_pred)
classification_rep = classification_report(y_test, y_pred)

print("Accuracy: ", accuracy)
print("Confusion Matrix: ", conf_matrix)
print("Classification Report: ", classification_rep)


with open("random_forest_model.pkl", "wb") as file:
    pickle.dump(model, file)
    
    
    
    
    
train_data,test_data = train_test_split(df, test_size=0.2,random_state=42)

train_data.to_csv("train_data.csv",index=False)
test_data.to_csv("test_data.csv",index=False)