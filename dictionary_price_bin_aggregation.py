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

AppleData[0].append('Price_Bin')

for row in AppleData[1:]:
    if row[4] >= 0 and row[4] <= 5:
        row.append('0 to 5')
    elif row[4] > 5 and row[4] <= 10:
        row.append('5 to 10')
    else:
        row.append('10 above')


Price_Dict = {}
for row in AppleData[1:]:
    if row[-1] in Price_Dict:
        Price_Dict[row[-1]] += 1
    else:
        Price_Dict[row[-1]] = 1
print(Price_Dict)