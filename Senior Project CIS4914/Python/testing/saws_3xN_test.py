# Initial terms
sequence = [3, 49, 322, 1618, 7119, 28917, 111360, 412998, 1490095]

# Input: total number of terms
total_terms = int(input("Enter the total number of terms to generate: "))

# Generate terms using the recurrence relation
for n in range(len(sequence), total_terms):
    new_term = (10 * sequence[-1]
                - 37 * sequence[-2]
                + 59 * sequence[-3]
                - 27 * sequence[-4]
                - 25 * sequence[-5]
                + 21 * sequence[-6]
                + 5 * sequence[-7]
                - 4 * sequence[-8]
                - sequence[-9])
    sequence.append(new_term)

print("hi")
# Print the sequence
print(sequence)
