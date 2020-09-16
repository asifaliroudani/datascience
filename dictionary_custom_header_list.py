from csv import reader
filename = open('AppleStore.csv')
filereader = reader(filename)
AppleData = list(filereader)

header = []
for row in AppleData[0]:
    header.append(row)

header_dict = {}

for name in header:
    header_dict[name] = header.index(name)

custom_list = []

for row in AppleData[0:5]:
    custom_list.append([
                        row[header_dict['currency']],
                        row[header_dict['id']],
                        row[header_dict['track_name']],
                        row[header_dict['rating_count_tot']]
    ])
print(custom_list)