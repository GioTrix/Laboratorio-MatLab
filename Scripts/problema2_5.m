% Matrice A e vettore b del sistema lineare
A = [5 1 2; -1 7 1; 0 1 -3];
b = [13; 16; -7];

% (a) Soluzione del sistema con Matlab
x = A\b;

% Punto (b)
% Inizializzazione delle variabili
S=zeros(3,12);
x0 = zeros(3,1);
epsilon = -1; % valore di precisione

for i=2:11
[x_jacobi, K, r_norm] = metodoJacobi(A, b, epsilon, S(: , i-1), 1);
S (: , i )= x_jacobi;
end
S(: ,12)=x;
disp(S);

% Punto (c)
 table_data = zeros(10, 9);
 for i = 1:10
     epsilon = 10^(-i);
     [x_jacobi, K, r_norm] = metodoJacobi(A, b, epsilon, x0,10^9);
     error_norm = norm(x_jacobi - x, 1);
     table_data(i,:) = [epsilon, K, horzcat(x_jacobi', x'), error_norm];
 end
 disp(table_data);
