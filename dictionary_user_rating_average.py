from csv import reader
filename = open('AppleStore.csv')
filereader = reader(filename)
AppleData = list(filereader)

#average user rating = user_rating_sum / user_rating_count

for row in AppleData[1:]:
    row[7] = float(row[7])

user_rating_sum = 0
user_rating_count = 0
user_rating_average = 0

# for row in AppleData[1:]:
#     user_rating_sum += row[7]
#     user_rating_count += 1

for row in AppleData[1:]:
    if row[7] != 0:
        user_rating_sum += row[7]
        user_rating_count += 1

user_rating_average = user_rating_sum / user_rating_count
print(user_rating_average)
