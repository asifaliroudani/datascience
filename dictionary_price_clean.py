from csv import reader
filename = open('AppleStore.csv')
filereader = reader(filename)
AppleData = list(filereader)

for row in AppleData[1:]:
    if row[4] == '$1.99 ':
        row[4] = 1.99
    elif row[4] == '$0.99 ':
        row[4] = 0.99
    elif row[4] == '&6.99':
        row[4] = 6.99
    else:
        row[4] = float(row[4])

Price_Dict = {}
for row in AppleData[1:]:
    if row[4] in Price_Dict:
        Price_Dict[row[4]] += 1
    else:
        Price_Dict[row[4]] = 1
print(Price_Dict)