clc; clear;

% counting SAWs on a 3 by n lattice grid by recursion
% A288527

n = input('Enter n: ');

% intializing

counts = zeros(1,n);
counts(1) = 3;

AC0 = zeros(1,n);

A0 = ones(1,n);

A1 = zeros(1,n);

A2 = zeros(1,n);

A3C = zeros(1,n);
A3D = zeros(1,n);

%A4 = zeros(1,n); Equals A1 by symmetry

A5C = zeros(1,n);
A5D = zeros(1,n);

%A6C = zeros(1,n); Equals A3C by symmetry
%A6D = zeros(1,n); Equals A3D by symmetry

A7C1 = zeros(1,n);
A7C2 = zeros(1,n);
%A7C3 = zeros(1,n); Equals A7C1 by symmetry
A71 = zeros(1,n);
%A72 = zeros(1,n); Equals A7D1 by symmetry

% computing sums with recurrence relations

for ii = 2:n

    AC0(ii) = counts(ii-1); 

    A1(ii) = 3*A0(ii-1) + 2*A1(ii-1) + A2(ii-1) + 3*A3C(ii-1) + 2*A5C(ii-1) + A71(ii-1);
    
    A2(ii) = 3*A0(ii-1) + 2*A1(ii-1) + A2(ii-1) + 2*A3C(ii-1) + 2*A5C(ii-1);
    
    A3C(ii) = A0(ii-1) + A3C(ii-1) + A5C(ii-1);
    A3D(ii) = 2*A0(ii-1) + 3*A1(ii-1) + A2(ii-1) + A3C(ii-1) + A3D(ii-1) + A5C(ii-1) + A5D(ii-1) + A7C1(ii-1) + A7C2(ii-1);
    
    A5C(ii) = A0(ii-1) + 2*A3C(ii-1) + A5C(ii-1);
    A5D(ii) = 3*A0(ii-1) + 4*A1(ii-1) + 2*A2(ii-1) + 2*A3C(ii-1) + 2*A3D(ii-1) + A5D(ii-1) + 2*A7C1(ii-1);
    
    A7C1(ii) = A0(ii-1) + A3C(ii-1) + A1(ii-1) + A7C1(ii-1);
    A7C2(ii) = A5C(ii-1) + A7C2(ii-1);
    A71(ii) = A0(ii-1) + A1(ii-1) + A3C(ii-1) + A5C(ii-1) + A7C1(ii-1) + A7C2(ii-1);

    counts(ii) = AC0(ii) + 3*A0(ii) + 6*A1(ii) + 3*A2(ii) + 4*A3C(ii) + 2*A3D(ii) + 3*A5C(ii) + A5D(ii) + 2*A71(ii);

end