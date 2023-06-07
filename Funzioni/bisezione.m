function [approx, K, f_approx] = bisezione(f, a, b, epsilon)
% Input:
%   f: la funzione continua definita sull'intervallo [a, b]
%   a, b: gli estremi dell'intervallo [a, b], con f(a)f(b) < 0
%   tol: la soglia di precisione, cioè il criterio di arresto del metodo
% Output:
%   approx: l'approssimazione dell'unico zero di f(x) nell'intervallo [a, b]
%   K: l'indice di arresto del metodo di bisezione
%   f_approx: il valore della funzione f(x) calcolato in approx


% Inizializzazione dell'indice di arresto
K = 0;

%formula di bisezione
while (b - a) > epsilon
    if f(a)*f((a+b)/2) <=0
        b=(a+b)/2;
    
    else 
        a=(a+b)/2;
    end
    K=K+1;
end

%approssimazione
approx = (a+b)/2;
f_approx = f(approx);