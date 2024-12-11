clc; clear;

% works for all n
% counting Hamiltonian paths on a 3 by n lattice grid by recursion

n = input('Enter n: ');

% intializing

counts = zeros(1,n);
counts(1) = 1;

A01 = zeros(1,n);
A01(1) = 1;
A02 = A01;
A03 = A01;

A11 = zeros(1,n);
A12 = zeros(1,n);
A13 = zeros(1,n);

A21 = zeros(1,n);
A22 = zeros(1,n);

A30C = zeros(1,n);
A32C = zeros(1,n);
A32D = zeros(1,n);

A41 = zeros(1,n);
A42 = zeros(1,n);
A43 = zeros(1,n);

A50C = zeros(1,n);
A51C = zeros(1,n);
A51D = zeros(1,n);
A52C = zeros(1,n);
A52D = zeros(1,n);
A53 = zeros(1,n);

A60C = zeros(1,n);
A61C = zeros(1,n);
A61D = zeros(1,n);

A701 = zeros(1,n);
A702 = zeros(1,n);
A703 = zeros(1,n);
A71 = zeros(1,n);
A72 = zeros(1,n);

% computing sums with recurrence relations

for ii = 2:n

    A11(ii) = A03(ii-1) + A32C(ii-1) + A43(ii-1) + A52C(ii-1) + A61C(ii-1) + A72(ii-1);
    A12(ii) = A11(ii);
    A13(ii) = A11(ii);
    
    A21(ii) = A51C(ii-1) + A52C(ii-1);
    A22(ii) = A21(ii);
    
    A30C(ii) = A52C(ii-1);
    A32C(ii) = A30C(ii);
    A32D(ii) = A02(ii-1) + A12(ii-1) + A42(ii-1) + A52D(ii-1) + A702(ii-1) + A703(ii-1) + A50C(ii-1) + A60C(ii-1);
    
    A41(ii) = A03(ii-1) + A13(ii-1) + A32C(ii-1) + A51C(ii-1) + A61C(ii-1) + A71(ii-1);
    A42(ii) = A41(ii);
    A43(ii) = A41(ii);
    
    A50C(ii) = A03(ii-1) + A32C(ii-1) + A61C(ii-1);
    A51C(ii) = A50C(ii);
    A51D(ii) = A01(ii-1) + A02(ii-1) + A12(ii-1) + A21(ii-1) + A22(ii-1) + A30C(ii-1) + A32D(ii-1) + A41(ii-1) + A60C(ii-1) + A61D(ii-1) + A701(ii-1) + A703(ii-1);
    A52C(ii) = A50C(ii);
    A52D(ii) = A51D(ii);
    A53(ii) = A51D(ii);
    
    A60C(ii) = A51C(ii-1);
    A61C(ii) = A60C(ii);
    A61D(ii) = A01(ii-1) + A11(ii-1) + A41(ii-1) + A51D(ii-1) + A701(ii-1) + A702(ii-1) + A30C(ii-1) + A50C(ii-1);
    
    A701(ii) = A01(ii-1) + A30C(ii-1) + A41(ii-1) + A701(ii-1);
    A702(ii) = A50C(ii-1) + A702(ii-1);
    A703(ii) = A02(ii-1) + A12(ii-1) + A60C(ii-1) + A703(ii-1);
    A71(ii) = A02(ii-1) + A12(ii-1) + A50C(ii-1) + A60C(ii-1) + A702(ii-1) + A703(ii-1);
    A72(ii) = A01(ii-1) + A30C(ii-1) + A50C(ii-1) + A41(ii-1) + A701(ii-1) + A702(ii-1);

    counts(ii) = A13(ii) + A32C(ii) + A43(ii) + A51C(ii) + A52C(ii) + A53(ii) + A61C(ii) + A71(ii) + A72(ii);

end