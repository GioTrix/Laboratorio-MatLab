% Implementazione del metodo di Jacobi per risolvere un sistema lineare Ax=b
% Input: matrice A, vettore b, soglia di precisione epsilon, vettore iniziale x0, numero massimo di iterazioni Nmax
% Output: vettore soluzione x, numero di iterazioni k, norma del residuo rnorm
function [x, k, rnorm] = metodoJacobi(A, b, epsilon, x0, Nmax)

r = b - A*x0; % residuo iniziale
rnorm = norm(r); % norma del residuo iniziale
k = 0; % numero di iterazioni effettuate
D = diag(A); %vettore delle componenti diagonali di A
x = x0; % inizializzazione del vettore x

while (rnorm > epsilon*norm(b)) && (k < Nmax)
    x = x + r./D; % calcolo del nuovo vettore x
    r = b - A*x; % calcolo del nuovo residuo
    rnorm = norm(r); % calcolo della nuova norma del residuo
    k = k + 1; % incremento del contatore delle iterazioni
end

if k == Nmax % se si è raggiunto il numero massimo di iterazioni consentite
    disp('Il metodo di Jacobi ha raggiunto il numero massimo di iterazioni consentite.');
end

end
