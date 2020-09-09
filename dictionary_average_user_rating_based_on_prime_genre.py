from csv import reader
filename = open('AppleStore.csv')
filereader = reader(filename)
AppleData = list(filereader)

# variables
prime_genre = 11
user_rating = 7

# dictionaries
Prime_Genre_Count_Dict = {}
Prime_Genre_User_Rating_Total_Dict = {}
Prime_Genre_User_Rating_Average_Dict = {}

# loops
# Prime Genre Count
for row in AppleData[1:]:
    if row[prime_genre] in Prime_Genre_Count_Dict:
        Prime_Genre_Count_Dict[row[prime_genre]] += 1
    else:
        Prime_Genre_Count_Dict[row[prime_genre]] = 1
print(Prime_Genre_Count_Dict)

# Prime Genre User Rating total
for row in AppleData[1:]:
    if row[prime_genre] in Prime_Genre_User_Rating_Total_Dict:
        Prime_Genre_User_Rating_Total_Dict[row[prime_genre]] += float(row[user_rating])
    else:
        Prime_Genre_User_Rating_Total_Dict[row[prime_genre]] = float(row[user_rating])
print(Prime_Genre_User_Rating_Total_Dict)

for key,value in Prime_Genre_Count_Dict.items():
    Prime_Genre_User_Rating_Average_Dict[key] = Prime_Genre_User_Rating_Total_Dict[key] / Prime_Genre_Count_Dict[key]
print(Prime_Genre_User_Rating_Average_Dict)


