# Initial terms
sequence = [1, 8, 20, 62, 132, 336, 688, 1578]

# Input: total number of terms
total_terms = int(input("Enter the total number of terms to generate: "))

# Generate terms using the recurrence relation
for n in range(len(sequence), total_terms):
    new_term = (3 * sequence[-1]
                + 2 * sequence[-2]
                - 12 * sequence[-3]
                + 4 * sequence[-4]
                + 12 * sequence[-5]
                - 8 * sequence[-6])
    sequence.append(new_term)

# Print the sequence
print(sequence)
