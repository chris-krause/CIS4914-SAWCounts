clc; clear;

% counting SAPs (loops) on a 3 by n lattice grid by recursion [WORKS]

n = input('Enter n: ');

% intializing

counts = zeros(1,n);
counts(1) = 0;

AC0 = zeros(1,n);

A00 = ones(1,n);
A01 = ones(1,n);
A02 = ones(1,n);
A03 = ones(1,n);

A10 = zeros(1,n);
A11 = zeros(1,n);
A12 = zeros(1,n);

A20 = zeros(1,n);
A21 = zeros(1,n);
A22 = zeros(1,n);
A23 = zeros(1,n);

A30 = zeros(1,n);
A31 = zeros(1,n);
A32 = zeros(1,n);

% computing sums with recurrence relations

for ii = 2:n

    AC0(ii) = counts(ii-1); 

    A10(ii) = A01(ii-1) + A10(ii-1) + A22(ii-1);
    A11(ii) = A10(ii);
    A12(ii) = A10(ii);
    
    A20(ii) = A03(ii-1) + A12(ii-1) + A20(ii-1) + A31(ii-1);
    A21(ii) = A20(ii);
    A22(ii) = A20(ii);
    A23(ii) = A20(ii);
    
    A30(ii) = A02(ii-1) + A21(ii-1) + A30(ii-1);
    A31(ii) = A30(ii);
    A32(ii) = A30(ii);

    counts(ii) = AC0(ii) + A11(ii) + A23(ii) + A32(ii);

end