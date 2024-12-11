clc; clear;

n = input('Enter n: ');

% Initialization

A = zeros(1,n);
B = zeros(1,n);

C = zeros(1,n);
C(1) = 1;

D = zeros(1,n);
D(1) = 1;

E = zeros(1,n);
E(1) = 1;

% Recurrence

for ii = 2:n
    A(ii) = D(ii-1);
    B(ii) = C(ii-1);
    C(ii) = A(ii-1) + B(ii-1);
    D(ii) = A(ii-1) + B(ii-1);
    E(ii) = A(ii-1) + B(ii-1);
end

