clc; clear;

% counts(k) = the number of Hamiltonian cycles in P_4 x P_n
% Recurrence is simplified by applying symmetries of vertical slicess
% Initialization

n = input('Enter n: ');

A = zeros(1,n);

B = zeros(1,n);

C = zeros(1,n);
C(2) = 1;

E = zeros(1,n);
E(2) = 1;

F = zeros(1,n);

counts = zeros(1,n);
counts(2) = 1;

% Recurrence

for ii = 3:n
    A(ii) = C(ii-1) + F(ii-1);
    B(ii) = C(ii-1);
    C(ii) = 2*A(ii-1) + B(ii-1) + E(ii-1);
    E(ii) = 2*A(ii-1) + E(ii-1);
    F(ii) = C(ii-1) + F(ii-1);
    counts(ii) = C(ii) + F(ii);
end