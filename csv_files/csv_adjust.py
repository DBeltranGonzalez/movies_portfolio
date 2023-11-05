# Por si molesta la importación con el archivo separados por ;

import csv

input_file = ''
output_file = ''

with open(input_file, 'r') as file:
    reader = csv.reader(file, delimiter=';')
    rows = list(reader)

with open(output_file, 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerows(rows)

