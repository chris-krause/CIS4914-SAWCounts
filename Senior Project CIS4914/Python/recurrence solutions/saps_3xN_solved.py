import sympy as sp

# Define symbols for A1, A2, and counts at time i and i-1
A1, A2, counts, A1_prev, A2_prev, counts_prev = sp.symbols('A1 A2 counts A1_prev A2_prev counts_prev')

# Define the transformation matrix for the system
T = sp.Matrix([
    [1, 1, 0],  # A1(i) = 1 + A1(i-1) + A2(i-1)
    [2, 1, 0],  # A2(i) = 1 + 2*A1(i-1) + A2(i-1)
    [2, 1, 1]   # counts(i) = counts(i-1) + 2*A1(i) + A2(i)
])

# Find the characteristic polynomial for the system
char_poly = T.charpoly()
print("Characteristic Polynomial of the system:")
print(char_poly.as_expr())

