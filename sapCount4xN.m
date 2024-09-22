clc; clear;

% counting SAPs (loops) on a 4 by n lattice grid by recursion

n = input('Enter n: ');

% intializing

counts = zeros(1,n);

AC0 = zeros(1,n);

A0 = ones(1,n);
A1 = zeros(1,n);
A2 = zeros(1,n);
A3 = zeros(1,n);
A4 = zeros(1,n);
A5 = zeros(1,n);
A6 = zeros(1,n);
A71 = zeros(1,n);
A72 = zeros(1,n);

% computing sums with recurrence relations

for ii = 2:n

    AC0(ii) = counts(ii-1); 

    A1(ii) = A0(ii-1) + A1(ii-1) + A4(ii-1) + A6(ii-1) + A71(ii-1);

    A2(ii) = A0(ii-1) + A2(ii-1) + A4(ii-1) + A5(ii-1) + A6(ii-1);
    
    A3(ii) = A0(ii-1) + A3(ii-1) + A5(ii-1) + A6(ii-1) + A71(ii-1);
    
    A4(ii) = A0(ii-1) + A1(ii-1) + A2(ii-1) + A4(ii-1) + A5(ii-1) + A6(ii-1);

    A5(ii) = A0(ii-1) + A2(ii-1) + A3(ii-1) + A4(ii-1) + A5(ii-1) + A6(ii-1);
    
    A6(ii) = A0(ii-1) + A1(ii-1) + A2(ii-1) + A3(ii-1) + A4(ii-1) + A5(ii-1) + A6(ii-1) + A72(ii-1);
    
    A71(ii) = A6(ii-1) + A71(ii-1);

    A72(ii) = A0(ii-1) + A1(ii-1) + A3(ii-1) + A72(ii-1);

    counts(ii) = AC0(ii) + A1(ii) + A2(ii) + A3(ii) + A4(ii) + A5(ii) + A6(ii) + A71(ii);
    
end