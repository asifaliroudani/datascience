from csv import reader
filename = open('AppleStore.csv')
filereader = reader(filename)
AppleData = list(filereader)

header = []
for row in AppleData[0]:
    header.append(row)

print(header)
custom_list = []


for row in AppleData:
    custom_list.append([
                    row[header.index("currency")],
                    row[header.index("id")],
                    row[header.index("rating_count_tot")],
                    row[header.index("sup_devices.num")],
                    row[header.index("ipadSc_urls.num")],
                    row[header.index("lang.num")],
                    row[header.index("vpp_lic")],
                    row[header.index("track_name")],
                    row[header.index("size_bytes")],
                    row[header.index("price")],
                    row[header.index("rating_count_ver")],
                    row[header.index("user_rating")],
                    row[header.index("user_rating_ver")],
                    row[header.index("ver")],
                    row[header.index("cont_rating")],
                    row[header.index("prime_genre")]
    ])

print(custom_list[0:4])

