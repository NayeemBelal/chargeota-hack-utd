import tensorflow as tf
import csv
import pandas as pd

def read_csv_file(file_path):
    with open(file_path, 'r', newline='') as file:
        csv_reader = csv.reader(file)
        for row in csv_reader:
            print(row) 
file_path = 'Users/faris/Desktop/testing/data50 - Sheet1.csv'
df = pd.read_csv(file_path)
df = pd.DataFram(df)
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