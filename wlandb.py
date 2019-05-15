#!/bin/python

import argparse 
import csv
import mysql.connector 

parser = argparse.ArgumentParser(description='Read aerodump csv files and write contents to dataabase')

parser.add_argument('csv_filename', metavar='path_to_csv_file', help='A csv file generated by aerodump-ng.')

args = parser.parse_args()

print(args.csv_filename)

with open(args.csv_filename) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    
    # Access points are first
    last_line_of_access_points = 0

    for row in csv_reader:
        if line_count == 0:
            line_count += 1
        elif len(row) == 0: 
            # List of access points end with an empty line
            last_line_of_access_points = line_count - 1;
            break
        else:
            print(row)
            line_count += 1

# Insert rows to database 



# todo: start from the row last_line_of_access_points + 2 and 
# write stations to database in a second table
