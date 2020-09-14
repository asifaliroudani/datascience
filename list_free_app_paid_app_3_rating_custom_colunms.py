from csv import reader
filename = open('AppleStore.csv')
filereader = reader(filename)
AppleData = list(filereader)

# lists
free_app_list = []
free_app_list_rating = []
paid_app_list = []
paid_app_list_rating = []

# free app

for row in AppleData[1:]:
    if row[4] == '$1.99 ':
        row[4] = 1.99
    elif row[4] == '$0.99 ':
        row[4] = 0.99
    elif row[4] == '&6.99':
        row[4] = 6.99
    else:
        row[4] = float(row[4])

for row in AppleData[1:]:
    row[7] = float(row[7])

for row in AppleData[1:]:
    if row[4] == 0:
        free_app_list.append(row[0])
    if row[4] == 0 and row[7] >= 3:
        free_app_list_rating.append(row[0])
    if row[4] > 0:
        paid_app_list.append(row[0])
    if row[4] > 0 and row[7] >= 3:
        paid_app_list_rating.append(row[0])

print(free_app_list)
print(free_app_list_rating)
print(paid_app_list)
print(paid_app_list_rating)

print(len(free_app_list))
print(len(free_app_list_rating))
print(len(paid_app_list))
print(len(paid_app_list_rating))