function S = formulacavalierisimpson(f, a, b, n)
% INPUT:
% f = una funzione definita sull'intervallo [a, b]
% a, b = estremi dell'intervallo scelto
% n = numero intero >= 1
% OUTPUT:
% S = approssimazione dell'integrale di f su [a, b] dato
% dalla formula di Cavalieri-Simpson di ordine n in cui l'intervallo [a, b] è
% suddiviso in n sotto-intervalli

h = (b-a) / n;
Z = zeros(1,n-1);
Z1 = zeros(1,n);
sum1 = 0;
sum2 = 0;

% calcolo la prima sommatoria della formula
for i = 1:n-1
Z(i) = f(a+i*h);
sum1 = sum1 + Z(i);
end

% calcolo la seconda sommatoria della formula
for j = 1:n
Z1(j) = f(a+h*(j-1/2));
sum2 = sum2 + Z1(j);
end

S = h/6 * (f(a) + f(b) + 2*sum1 + 4*sum2); % formula di Cavalieri-Simpson

end




