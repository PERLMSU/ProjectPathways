import csv
import timeit

starttime = timeit.default_timer()

file_location = "C:\\Users\\John\\OneDrive\\Work\\educational data mining consulting\\MSU project pathways\\data\\social network analysis\\"

with open(file=file_location+"edges_raw.csv", mode="r",encoding='utf-8') as raw:
     reader = csv.reader(raw, delimiter=',')
     raw_data = [r for r in reader]

# remove column headers
"""
raw_data = [ [student_id, course_id],... ]
"""
raw_data = raw_data[1:]

edges=[]

for row1 in raw_data:
    id = row1[0]
    course = row1[1]
    for row2 in raw_data:
        if id not in row2:
            if course not in row2:
                pass
            else:
                edges.append([row1[0], row2[0], row1[1]])


with open(file=file_location+"edges.csv", mode="w") as e_file:
    writer = csv.writer(e_file, newline="\n")
    writer.writerow(["Source","Target","Course"])
    for row in edges:
        writer.writerow(row)

endtime = timeit.default_timer()
print(endtime - starttime)

