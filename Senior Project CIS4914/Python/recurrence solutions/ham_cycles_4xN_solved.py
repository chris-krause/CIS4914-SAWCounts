import sympy as sp

# Define the transformation matrix T
T = sp.Matrix([
    [0, 0, 1, 0, 1],
    [0, 0, 1, 0, 0],
    [2, 1, 0, 1, 0],
    [2, 0, 0, 1, 0],
    [0, 0, 1, 0, 1]
])

# Compute and print the characteristic polynomial
char_poly = T.charpoly()
print("\nCharacteristic Polynomial:")
print(char_poly.as_expr())

# Build the recurrence relation from coefficients
coefficients = char_poly.coeffs()
n = len(coefficients) - 1
recurrence = f"a[i] = " + " + ".join(
    f"{-coefficients[j+1]}*a[i-{j+1}]" for j in range(n)
)

# Output the recurrence relation
print("\nRecurrence Relation for the number of Hamiltonian cycles in P_4 X P_n:")
print(recurrence)