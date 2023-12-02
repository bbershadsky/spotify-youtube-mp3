import csv

# Open the input CSV file for reading
with open('mix.csv', 'r') as csv_file:
    # Create a CSV reader
    csv_reader = csv.reader(csv_file)
    
    # Skip the first line (header)
    next(csv_reader, None)
    
    # Open the output file for writing
    with open('batch_titles.txt', 'w') as output_file:
        for row in csv_reader:
            # Check if the row has at least 2 values
            if len(row) >= 2:
                # Extract the first 2 CSV values and write them to the output file
                output_file.write(f'{row[0]}, {row[1]}\n')
