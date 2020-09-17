def calculate_sum(parameter1, parameter2):
    total = 0
    total = float(parameter1) + float(parameter2)
    return total


total_sum = 0
total_sum = calculate_sum(1, 2)
print(total_sum)


def calculate_sum_using_list(parameter):
    total = 0
    total = sum(parameter)
    return total


list_to_add = [1, 2, 3, 4, 5, 6]
total_sum_of_list = 0
total_sum_of_list = calculate_sum_using_list(list_to_add)
print(f'total value of list is {total_sum_of_list}')
