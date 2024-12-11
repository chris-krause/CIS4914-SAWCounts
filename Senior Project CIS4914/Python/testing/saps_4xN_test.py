# Initial terms
sequence = [6, 40, 213, 1049, 5034, 23984, 114069]

# Input: total number of terms
total_terms = int(input("Enter the total number of terms to generate: "))

# Generate terms using the recurrence relation
for n in range(len(sequence), total_terms):
    new_term = (9 * sequence[-1]
                - 27 * sequence[-2]
                + 38 * sequence[-3]
                - 29 * sequence[-4]
                + 11 * sequence[-5]
                + sequence[-6]
                - 2 * sequence[-7])
    sequence.append(new_term)

# Print the sequence
print(sequence)
