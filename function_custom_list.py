from csv import reader

filename = open('AppleStore.csv')
filereader = reader(filename)
AppleData = list(filereader)

header_list = AppleData[0]
# print(header_list)
# ['id', 'track_name', 'size_bytes', 'currency', 'price', 'rating_count_tot', 'rating_count_ver', 'user_rating',
# 'user_rating_ver', 'ver', 'cont_rating', 'prime_genre', 'sup_devices.num', 'ipadSc_urls.num', 'lang.num', 'vpp_lic']

header_index = []
for row in header_list:
    header_index.append(header_list.index(row))


# print(header_index)
# [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]


def get_custom_header_list(custom_header_list_parameter=header_list):
    custom_header_list_index = []
    for custom_header in custom_header_list_parameter:
        custom_header_list_index.append(header_list.index(custom_header))
    # print(custom_header_list_index)
    # [0, 1, 3, 4]

    new_custom_header_multi_list = []
    for row in AppleData[1:5]:
        new_custom_header_list = []
        for index in custom_header_list_index:
            new_custom_header_list.append(row[index])
        new_custom_header_multi_list.append(new_custom_header_list)
    return new_custom_header_multi_list


# things used in functions should be below function (def)``
custom_header_list = ['id', 'track_name', 'currency', 'price']

custom_list_output = []
custom_list_output = get_custom_header_list(custom_header_list)
print(custom_list_output)
print(custom_list_output[0:2])
# [['284882215', 'Facebook', 'USD', '0'], ['389801252', 'Instagram', 'USD', '0']]
