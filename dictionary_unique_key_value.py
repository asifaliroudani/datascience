from csv import reader
filename = open('AppleStore.csv')
filereader = reader(filename)
AppleData = list(filereader)

Price_Dict = {}

for row in AppleData[1:]:
    if row[4] in Price_Dict:
        Price_Dict[row[4]] += 1
    else:
        Price_Dict[row[4]] = 1
print(Price_Dict)


