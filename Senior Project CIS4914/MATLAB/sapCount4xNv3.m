clc; clear;

% counting SAPs (loops) on a 4 by n lattice grid by recursion

n = input('Enter n: ');

% intializing

counts = zeros(1,n);

A1 = zeros(1,n);
A2 = zeros(1,n);
A4 = zeros(1,n);
A6 = zeros(1,n);
A71 = zeros(1,n);
A72 = zeros(1,n);

% computing sums with recurrence relations

for ii = 2:n

    A1(ii) = 1 + A1(ii-1) + A4(ii-1) + A6(ii-1) + A71(ii-1);

    A2(ii) = 1 + A2(ii-1) + 2*A4(ii-1) + A6(ii-1);
    
    A4(ii) = 1 + A1(ii-1) + A2(ii-1) + 2*A4(ii-1) + A6(ii-1);
    
    A6(ii) = 1 + 2*A1(ii-1) + A2(ii-1) + 2*A4(ii-1) + A6(ii-1) + A72(ii-1);
    
    A71(ii) = A6(ii-1) + A71(ii-1);

    A72(ii) = 1 + 2*A1(ii-1) + A72(ii-1);

    counts(ii) = counts(ii-1) + 2*A1(ii) + A2(ii) + 2*A4(ii) + A6(ii) + A71(ii);
    
end