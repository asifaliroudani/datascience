import string
from csv import reader
from typing import Any, Union

filename = open('AppleStore.csv')
filereader = reader(filename)
AppleData = list(filereader)

CleanerCharacter = [
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w",
    "x", "y", "z",
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W",
    "X", "Y", "Z",
    "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "+", "=", "-", "<", ">", "?", ",", "/", ":", ";", "\"", "\'",
    "\\", " "
]


def data_clean(string):
    for char in CleanerCharacter:
        string = string.replace(char,'')
    return string


for row in AppleData[1:]:
    row[4] = data_clean(row[4])

Price_Dict = {}
for row in AppleData[1:]:
    if row[4] in Price_Dict:
        Price_Dict[row[4]] += 1
    else:
        Price_Dict[row[4]] = 1
print(Price_Dict)
