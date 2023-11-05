import tensorflow as tf
import csv
import pandas as pd


df = pd.read_csv("dat1.csv")
df = pd.DataFrame(df)
results = []
for index, row in df.iterrows():
    schedule = row['Schedule'].split(', ')
    day_slots = [0] * 24
    for slot in schedule:
        times = slot.split(' - ')
        start_time, end_time = times[0], times[1]
        start, end = int(start_time.split()[0]), int(end_time.split()[0])
        if 'am' in start_time and 'am' in end_time:
            for i in range(start, end):
                day_slots[i] = 1
        elif 'pm' in start_time and 'pm' in end_time:
            for i in range(start + 12, end + 12):
                day_slots[i] = 1
        elif 'am' in start_time and 'pm' in end_time:
            for i in range(start, 12):
                day_slots[i] = 1
            for i in range(12, end + 12):
                day_slots[i] = 1
    results.append(day_slots)
    print(f"Day {index}: {day_slots}")

    monday_list = []
tuesday_list = []
wednesday_list = []
thursday_list = []
friday_list = []
saturday_list = []
sunday_list = []

for index, row in df.iterrows():
    if index % 7 == 0:
        monday_list.append(results[index])
    elif index % 7 == 1:
        tuesday_list.append(results[index])
    elif index % 7 == 2:
        wednesday_list.append(results[index])
    elif index % 7 == 3:
        thursday_list.append(results[index])
    elif index % 7 == 4:
        friday_list.append(results[index])
    elif index % 7 == 5:
        saturday_list.append(results[index])
    elif index % 7 == 6:
        sunday_list.append(results[index])

print("Monday List:")
for day_slots in monday_list:
    print(day_slots)

print("\nTuesday List:")
for day_slots in tuesday_list:
    print(day_slots)

print("\nWed List:")
for day_slots in wednesday_list:
    print(day_slots)
print("\nThurs List:")
for day_slots in thursday_list:
    print(day_slots)
print("\nFri List:")
for day_slots in friday_list:
    print(day_slots)
print("\nSat List:")
for day_slots in saturday_list:
    print(day_slots)
print("\nSunday List:")
for day_slots in sunday_list:
    print(day_slots)
    
    import numpy as np
    from sklearn.linear_model import LinearRegression
    import sklearn.linear_model 
    #import LinearRegression 
    from sklearn.model_selection import train_test_split

train = []
test = []
for sublist in monday_list[-4:]:
    for index in sublist:
        element = monday_list[index]
        test.append(element)


for sublist in monday_list[:8]:
    for index in sublist:
        element = monday_list[index]
        train.append(element)
        import numpy as np


if len(train) != len(test):
    # Modify the datasets here to have the same number of samples
    # For example, you can select a subset of the larger dataset
    train = train[:len(test)]  # Adjust train to have the same number of samples as test


train = np.array(train)
test = np.array(test)


print("Shape of train:", train.shape)
print("Shape of test:", test.shape)
X_train, X_test, y_train, y_test = train_test_split(train, test, test_size = 0.3, random_state = 2)
regr = LinearRegression()
regr.fit(X_train, y_train)
pred = regr.predict(X_test)
pred
regr.score(X_test, y_test)

train2 = []
test2 = []
for sublist in tuesday_list[-4:]:
    for index in sublist:
        element = tuesday_list[index]
        test2.append(element)



for sublist in tuesday_list[:8]:
    for index in sublist:
        element = tuesday_list[index]
        train2.append(element)
import numpy as np


if len(train2) != len(test2):

    train2 = train2[:len(test2)] 


train2 = np.array(train2)
test2 = np.array(test2)


print("Shape of train:", train2.shape)
print("Shape of test:", test2.shape)
X_train2, X_test2, y_train2, y_test2 = train_test_split(train2, test2, test_size = 0.3, random_state = 2)
regr2 = LinearRegression()
regr.fit(X_train2, y_train2)
pred = regr.predict(X_test2)
pred
regr.score(X_test2, y_test2)

train3= []
test3 = []
for sublist in wednesday_list[-4:]:
    for index in sublist:
        element = wednesday_list[index]
        test3.append(element)


for sublist in wednesday_list[:8]:
    for index in sublist:
        element = wednesday_list[index]
        train3.append(element)
import numpy as np


if len(train3) != len(test3):

    train3 = train3[:len(test3)] 


train3 = np.array(train3)
test3 = np.array(test3)


print("Shape of train:", train3.shape)
print("Shape of test:", test3.shape)
X_train3, X_test3, y_train3, y_test3 = train_test_split(train3, test3, test_size = 0.3, random_state = 2)
regr3 = LinearRegression()
regr.fit(X_train3, y_train3)
pred = regr.predict(X_test3)
pred
regr.score(X_test3, y_test3)
train4= []
test4 = []
for sublist in thursday_list[-4:]:
    for index in sublist:
        element = thursday_list[index]
        test4.append(element)



for sublist in thursday_list[:8]:
    for index in sublist:
        element = thursday_list[index]
        train4.append(element)
import numpy as np


if len(train4) != len(test4):

    train4 = train4[:len(test4)]

train4 = np.array(train4)
test4 = np.array(test4)


print("Shape of train:", train4.shape)
print("Shape of test:", test4.shape)
X_train4, X_test4, y_train4, y_test4 = train_test_split(train4, test4, test_size = 0.3, random_state = 2)
regr4 = LinearRegression()
pred = regr.predict(X_test4)
pred
regr.score(X_test4, y_test4)
train5 = []
test5 = []
for sublist in friday_list[-4:]:
    for index in sublist:
        element = friday_list[index]
        test5.append(element)



for sublist in friday_list[:8]:
    for index in sublist:
        element = friday_list[index]
        train5.append(element)
        import numpy as np


if len(train5) != len(test5):

    train5 = train5[:len(test5)] 

train5 = np.array(train5)
test5 = np.array(test5)


print("Shape of train:", train5.shape)
print("Shape of test:", test5.shape)
X_train5, X_test5, y_train5, y_test5 = train_test_split(train5, test5, test_size = 0.3, random_state = 2)
regr5 = LinearRegression()
regr.fit(X_train5, y_train5)
pred = regr.predict(X_test5)
pred
regr.score(X_test5, y_test5)
train6 = []
test6 = []
for sublist in saturday_list[-4:]:
    for index in sublist:
        element = saturday_list[index]
        test6.append(element)



for sublist in saturday_list[:8]:
    for index in sublist:
        element = saturday_list[index]
        train6.append(element)
import numpy as np


if len(train6) != len(test6):

    train6 = train6[:len(test6)]


train6 = np.array(train6)
test6 = np.array(test6)


print("Shape of train:", train6.shape)
print("Shape of test:", test6.shape)
X_train6, X_test6, y_train6, y_test6 = train_test_split(train6, test6, test_size = 0.3, random_state = 2)
regr6 = LinearRegression()
regr.fit(X_train6, y_train6)
pred = regr.predict(X_test6)
pred
regr.score(X_test6, y_test6)
train7 = []
test7 = []
for sublist in sunday_list[-4:]:
    for index in sublist:
        element = sunday_list[index]
        test7.append(element)


for sublist in sunday_list[:8]:
    for index in sublist:
        element = sunday_list[index]
        train7.append(element)
import numpy as np


if len(train7) != len(test7):

    train7 = train7[:len(test7)]

train7 = np.array(train7)
test7 = np.array(test7)


print("Shape of train:", train7.shape)
print("Shape of test:", test7.shape)
X_train7, X_test7, y_train7, y_test7 = train_test_split(train7, test7, test_size = 0.3, random_state = 2)
regr7 = LinearRegression()
regr.fit(X_train7, y_train7)
pred = regr.predict(X_test7)
pred
regr.score(X_test7, y_test7)

