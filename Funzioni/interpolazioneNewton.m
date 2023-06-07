% INPUT: x, y, t sono vettori di componenti reali con x e y della stessa
% lunghezza e le componenti di x tutte diverse
% OUTPUT: p è il vettore contenente le valutazioni nei punti t del polinomio interpolante i dati (x,y)
function p = interpolazioneNewton(x, y, t)

% calcolo le differenze divise
n = length(x);
f = zeros(n,n);
f(:,1) = y(:);
for j = 2:n
    for i = 1:n-j+1
        f(i,j) = (f(i+1,j-1) - f(i,j-1)) / (x(i+j-1) - x(i));
    end
end

% calcolo il polinomio interpolante
p = f(1,n)*ones(size(t));
for j = n-1:-1:1
    p = p.*(t - x(j)) + f(1,j);
end