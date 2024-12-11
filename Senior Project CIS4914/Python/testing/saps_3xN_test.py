# Initial terms
sequence = [0, 3, 13]

# Input: total number of terms
total_terms = int(input("Enter the total number of terms to generate: "))

# Generate terms using the recurrence relation
for n in range(len(sequence), total_terms):
    new_term = 3 * sequence[-1] - sequence[-2] - sequence[-3] + 4
    sequence.append(new_term)

# Print the sequence
print(sequence)
