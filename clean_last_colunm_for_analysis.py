from csv import reader

filename = open('AppleStore.csv')
filereader = reader(filename)
AppleData = list(filereader)

header = AppleData[0]
header_count = len(header)

total_records = len(AppleData)
print('Total Dataset record is ', total_records)
# Total Dataset record is  7198

dataset = []

for data in AppleData[0:]:
    inner_dataset = []
    for i in range(12):
        inner_dataset.append(data[i])
    dataset.append(inner_dataset)

content_column_index = header.index('cont_rating')
price_column_index = header.index('price')

for row in dataset[1:]:
    row[content_column_index] = float(row[content_column_index].replace('+', ''))

for row in dataset[1:]:
    row[price_column_index] = float(row[price_column_index].replace('$', '').replace('&', '').replace(' ', ''))

content_rating_dict = {}
for row in dataset[1:]:
    if row[content_column_index] in content_rating_dict:
        content_rating_dict[row[content_column_index]] += 1
    else:
        content_rating_dict[row[content_column_index]] = 1
print(content_rating_dict)

price_rating_dict = {}
for row in dataset[1:]:
    if row[price_column_index] in price_rating_dict:
        price_rating_dict[row[price_column_index]] += 1
    else:
        price_rating_dict[row[price_column_index]] = 1

dataset[0].append('paid_free')

for row in dataset[1:]:
    if row[price_column_index] == 0:
        row.append('free')
    else:
        row.append('paid')

paid_free_dict = {}
for row in dataset[1:]:
    if row[-1] in paid_free_dict:
        paid_free_dict[row[-1]] += 1
    else:
        paid_free_dict[row[-1]] = 1

print(paid_free_dict)

paid_free_percentage_dict = {'free': paid_free_dict['free'] / (paid_free_dict['free'] + paid_free_dict['paid']) * 100,
                             'paid': paid_free_dict['paid'] / (paid_free_dict['free'] + paid_free_dict['paid']) * 100}

print(paid_free_percentage_dict)

genre_free_app_dict = {}
genre_column_index = header.index("prime_genre")

for row in dataset[1:]:
    if row[-1] == 'free':
        if row[genre_column_index] in genre_free_app_dict:
            genre_free_app_dict[row[genre_column_index]] += 1
        else:
            genre_free_app_dict[row[genre_column_index]] = 1
print(genre_free_app_dict)

genre_paid_app_dict = {}

for row in dataset[1:]:
    if row[-1] == 'paid':
        if row[genre_column_index] in genre_paid_app_dict:
            genre_paid_app_dict[row[genre_column_index]] += 1
        else:
            genre_paid_app_dict[row[genre_column_index]] = 1
print(genre_paid_app_dict)