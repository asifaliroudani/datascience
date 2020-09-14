from csv import reader
filename = open('AppleStore.csv')
filereader = reader(filename)
AppleData = list(filereader)

header_list = AppleData[0]
print(header_list)

id          = []
track_name  = []
size_bytes  = []
currency    = []
price       = []

for row in AppleData[1:]:
    id.append(row[0])
    track_name.append(row[header_list.index('track_name')])
print(id[:4])
print(track_name[:4])


