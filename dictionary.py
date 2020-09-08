from csv import reader
filename = open('AppleStore.csv')
filereader = reader(filename)
AppleData = list(filereader)
# print(AppleData)

Price_dict = {}
for row in AppleData[1:]:
    if row[4] in Price_dict:
        Price_dict[row[4]] += 1
    else:
        Price_dict[row[4]] = 1
print(Price_dict)

