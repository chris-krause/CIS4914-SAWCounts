clc; clear;

% works for all n
% counting Hamiltonian paths on a 3 by n lattice grid by recursion
% reduced recurrence system

n = input('Enter n: ');

% intializing

counts = zeros(1,n);
counts(1) = 1;
counts(2) = 8;

A = zeros(1,n);
A(2) = 1;

B = zeros(1,n);

C = zeros(1,n);
D = zeros(1,n);
D(2) = 1;

E = zeros(1,n);
E(2) = 1;
F = zeros(1,n);
F(2) = 2;

G = zeros(1,n);
G(2) = 1;
H = zeros(1,n);

I = zeros(1,n);
I(2) = 1;

% computing sums with recurrence relations

for ii = 3:n

    A(ii) = A(ii-1) + 2*C(ii-1) + E(ii-1) + I(ii-1);
    
    B(ii) = 2*E(ii-1);
    
    C(ii) = E(ii-1);
    D(ii) = 2*A(ii-1) + C(ii-1) + E(ii-1) + F(ii-1) + G(ii-1) + H(ii-1);
    
    E(ii) = 2*C(ii-1);
    F(ii) = 2*A(ii-1) + 2*B(ii-1) + 2*C(ii-1) + 2*D(ii-1) + 2*G(ii-1);

    G(ii) = A(ii-1) + C(ii-1) + G(ii-1);
    H(ii) = E(ii-1) + H(ii-1);

    I(ii) = A(ii-1) + C(ii-1) + E(ii-1) + G(ii-1) + H(ii-1);

    counts(ii) = 2*A(ii) + 2*C(ii) + 2*E(ii) + F(ii) + 2*I(ii);

end

disp(counts);