% Implementazione del metodo di Jacobi per risolvere un sistema lineare Ax=b
% Input: matrice A, termine noto b, soglia di precisione epsilon, vettore iniziale x0, numero massimo di iterazioni Nmax
%n = [n1,n2,...,nm] partizione
% Output: vettore soluzione x, numero di iterazioni k, norma del residuo rnorm
function [x, k, rnorm] = metodoJacobiBlocchi(A, b, epsilon, n,x0, Nmax)

r = b - A*x0; % residuo iniziale
rnorm = norm(r); % norma del residuo iniziale
k = 0; % numero di iterazioni effettuate
x = x0; % inizializzazione del vettore x
M = []; %precondizionatore
j = 1; %inizializzo l'indice delle prima colonnna della matrice A

%costruisco il precondizionatore della matrice a blocchi usando la
%partizione degli indici delle colonne di A specificata da n
for i=1:length(n)
    M=blkdiag(M,A(j:n(i)+j-1,j:n(i)+j-1));
    j = j + n(i); 
end

while (rnorm > epsilon*norm(b)) && (k < Nmax)
    x = x + M\r; % calcolo del nuovo vettore x
    r = b - A*x; % calcolo del nuovo residuo
    rnorm = norm(r); % calcolo della nuova norma del residuo
    k = k + 1; % incremento del contatore delle iterazioni
end
end
