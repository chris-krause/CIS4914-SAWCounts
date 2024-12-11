clc; clear;

% counting SAWs on a 3 by n lattice grid by recursion
% these SAWs span the lattice grid horizontally

n = input('Enter n: ');

% intializing

counts = zeros(1,n);
counts(1) = 3;

AC0 = zeros(1,n);

A00 = zeros(1,n);
A00(1) = 1;
A01 = zeros(1,n);
A01(1) = 1;
A02 = zeros(1,n);
A02(1) = 1;
A03 = zeros(1,n);
A03(1) = 1;

A10 = zeros(1,n);
A11 = zeros(1,n);
A12 = zeros(1,n);
A13 = zeros(1,n);

A20 = zeros(1,n);
A21 = zeros(1,n);
A22 = zeros(1,n);

A30C = zeros(1,n);
A30D = zeros(1,n);
A31 = zeros(1,n);
A32C = zeros(1,n);
A32D = zeros(1,n);

A40 = zeros(1,n);
A41 = zeros(1,n);
A42 = zeros(1,n);
A43 = zeros(1,n);

A50C = zeros(1,n);
A50D = zeros(1,n);
A51C = zeros(1,n);
A51D = zeros(1,n);
A52C = zeros(1,n);
A52D = zeros(1,n);
A53 = zeros(1,n);

A60C = zeros(1,n);
A60D = zeros(1,n);
A61C = zeros(1,n);
A61D = zeros(1,n);
A62 = zeros(1,n);

A701 = zeros(1,n);
A702 = zeros(1,n);
A703 = zeros(1,n);
A71 = zeros(1,n);
A72 = zeros(1,n);

% computing sums with recurrence relations

for ii = 2:n

    % AC0(ii) = counts(ii-1); 

    A10(ii) = A00(ii-1) + A01(ii-1) + A03(ii-1) + A10(ii-1) + A21(ii-1) + A30C(ii-1) + A32C(ii-1) + A43(ii-1) + A50C(ii-1) + A52C(ii-1) + A61C(ii-1) + A72(ii-1);
    A11(ii) = A10(ii);
    A12(ii) = A10(ii);
    A13(ii) = A10(ii);
    
    A20(ii) = A00(ii-1) + A01(ii-1) + A02(ii-1) + A11(ii-1) + A20(ii-1) + A30C(ii-1) + A42(ii-1) + A51C(ii-1) + A52C(ii-1) + A60C(ii-1);
    A21(ii) = A20(ii);
    A22(ii) = A20(ii);
    
    A30C(ii) = A01(ii-1) + A30C(ii-1) + A52C(ii-1);
    A30D(ii) = A00(ii-1) + A02(ii-1) + A10(ii-1) + A12(ii-1) + A20(ii-1) + A30D(ii-1) + A42(ii-1) + A50C(ii-1) + A52D(ii-1) + A60C(ii-1) + A702(ii-1) + A703(ii-1);
    A31(ii) = A30D(ii);
    A32C(ii) = A30C(ii);
    A32D(ii) = A30D(ii);
    
    A40(ii) = A00(ii-1) + A02(ii-1) + A03(ii-1) + A13(ii-1) + A22(ii-1) + A32C(ii-1) + A40(ii-1) + A50C(ii-1) + A51C(ii-1) + A60C(ii-1) + A61C(ii-1) + A71(ii-1);
    A41(ii) = A40(ii);
    A42(ii) = A40(ii);
    A43(ii) = A40(ii);
    
    A50C(ii) = A03(ii-1) + A32C(ii-1) + A50C(ii-1) + A61C(ii-1);
    A50D(ii) = A00(ii-1) + A01(ii-1) + A02(ii-1) + A10(ii-1) + A12(ii-1) + A21(ii-1) + A22(ii-1) + A30C(ii-1) + A32D(ii-1) + A40(ii-1) + A41(ii-1) + A50D(ii-1) +A60C(ii-1) + A61D(ii-1) + A701(ii-1) + A703(ii-1);
    A51C(ii) = A50C(ii);
    A51D(ii) = A50D(ii);
    A52C(ii) = A50C(ii);
    A52D(ii) = A50D(ii);
    A53(ii) = A50D(ii);
    
    A60C(ii) = A02(ii-1) + A51C(ii-1) + A60C(ii-1);
    A60D(ii) = A00(ii-1) + A01(ii-1) + A11(ii-1) + A20(ii-1) + A30C(ii-1) + A40(ii-1) + A41(ii-1) + A50C(ii-1) + A51D(ii-1) + A60D(ii-1) + A701(ii-1) + A702(ii-1);
    A61C(ii) = A60C(ii);
    A61D(ii) = A60D(ii);
    A62(ii) = A60D(ii);
    
    A701(ii) = A01(ii-1) + A30C(ii-1) + A41(ii-1) + A701(ii-1);
    A702(ii) = A50C(ii-1) + A702(ii-1);
    A703(ii) = A02(ii-1) + A12(ii-1) + A60C(ii-1) + A703(ii-1);
    A71(ii) = A02(ii-1) + A12(ii-1) + A50C(ii-1) + A60C(ii-1) + A702(ii-1) + A703(ii-1);
    A72(ii) = A01(ii-1) + A30C(ii-1) + A50C(ii-1) + A41(ii-1) + A701(ii-1) + A702(ii-1);

    counts(ii) = A01(ii) + A02(ii) + A03(ii) + A10(ii) + A11(ii) + A13(ii) + A20(ii) + A21(ii) + A22(ii) + A30C(ii) + A31(ii) + A32C(ii) + A40(ii) + A42(ii) + A43(ii) + A50C(ii) + A51C(ii) + A52C(ii) + A53(ii) + A60C(ii) + A61C(ii) + A62(ii) + A71(ii) + A72(ii);

end