% INPUT: 
%   - f: la funzione da integrare
%   - a, b: gli estremi dell'intervallo di integrazione
%   - n: il numero di sottointervalli in cui dividere [a,b]
% OUTPUT:
%   - I: l'approssimazione dell'integrale di f su [a,b] data dalla formula
%   dei trapezi di ordine n
function I = formulaTrapezi(f, a, b, n)

% calcolo la larghezza dei sottointervalli
h = (b - a) / n;

% valuto la funzione nei nodi di integrazione
x = linspace(a, b, n+1);
y = f(x);

% applico la formula dei trapezi
I = h/2 * (y(1) + 2*sum(y(2:end-1)) + y(end));
end
