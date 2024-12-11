
import sympy as sp

# Construct the transformation matrix T
T = sp.Matrix([
    [1, 6, 3, 4, 2, 3, 1, 2, 0, 0],
    [0, 2, 1, 3, 0, 2, 0, 0, 0, 1],
    [0, 2, 1, 2, 0, 2, 0, 0, 0, 0],
    [0, 0, 0, 1, 0, 1, 0, 0, 0, 0],
    [0, 3, 1, 1, 1, 1, 1, 1, 1, 0],
    [0, 0, 0, 2, 0, 1, 0, 0, 0, 0],
    [0, 4, 2, 2, 2, 0, 1, 2, 0, 0],
    [0, 1, 0, 1, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 1, 0, 0, 1, 0],
    [0, 1, 0, 1, 0, 1, 0, 1, 1, 0]
])

# Compute and print the characteristic polynomial
char_poly = T.charpoly()
print("\nCharacteristic Polynomial:")
print(char_poly.as_expr())

# Build the recurrence relation using the coefficients
coefficients = char_poly.coeffs()
n = len(coefficients) - 1
recurrence = f"a[i] = " + " + ".join(
    f"{-coefficients[j+1]}*a[i-{j+1}]" for j in range(n)
)

# Output the recurrence relation
print("\nRecurrence Relation for the number of self-avoiding walks in the grid graph P_3 X P_n:")
print(recurrence)

