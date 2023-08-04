#!/usr/bin/env python
# coding: utf-8

# In[5]:


import pandas as pd
import matplotlib.pyplot as plt

# Replace 'path/to/income_classification.csv' with the actual path to your file
file_path = 'income_evaluation.csv'

# Read the CSV file into a pandas DataFrame
df = pd.read_csv(file_path)

# Visualize the distribution of the 'age' column
plt.figure(figsize=(10, 6))
plt.hist(df['age'], bins=20, color='skyblue', edgecolor='black')
plt.xlabel('Age')
plt.ylabel('Frequency')
plt.title('Distribution of Age')
plt.show()


# In[10]:


# Pie chart for the distribution of income classes
plt.figure(figsize=(6, 6))
income_counts = df[' income'].value_counts()
plt.pie(income_counts, labels=income_counts.index, autopct='%1.1f%%', colors=['lightgreen', 'lightcoral'])
plt.title('Income Classes Distribution')
plt.show()


# In[12]:


# Bar plot of the 'education' column
plt.figure(figsize=(10, 6))
education_counts = df[' education'].value_counts()
education_counts.plot(kind='bar', color='salmon', edgecolor='black')
plt.xlabel('Education Level')
plt.ylabel('Count')
plt.title('Distribution of Education Levels')
plt.xticks(rotation=45)
plt.show()


# In[25]:


# Box plot of 'age' grouped by 'income'
plt.figure(figsize=(10, 6))
plt.boxplot([df[df[' income'] == ' <=50K']['age'], df[df[' income'] == ' >50K']['age']], labels=[' <=50K', ' >50K'])
plt.xlabel('Income')
plt.ylabel('Age')
plt.title('Age Distribution by Income')
plt.show()


# In[27]:


# Bar plot of the 'workclass' column
plt.figure(figsize=(10, 6))
workclass_counts = df[' workclass'].value_counts()
workclass_counts.plot(kind='bar', color='orange', edgecolor='black')
plt.xlabel('Workclass')
plt.ylabel('Count')
plt.title('Distribution of Workclass')
plt.xticks(rotation=45)
plt.show()


# In[30]:


plt.figure(figsize=(10,7))
sns.scatterplot(df, x= "age", y=" hours-per-week", hue=" income", s=25)
plt.title("Relationship between Age, Hours per Week, and Income")
plt.xlabel("Age")
plt.ylabel("Hours per Week")
plt.show()

