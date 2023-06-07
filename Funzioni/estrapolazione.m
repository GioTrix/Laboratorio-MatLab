function p0 = estrapolazione(f, a, b, v)
% INPUT:
% a, b = estremi dell'intervallo scelto
% f = funzione definita sull'intervallo [a, b]
% v = vettore di punti distinti, tutti i punti nel vettore >= 1
% OUTPUT:
% p0 = valore estrapolato p(0)

% Calcolo i passi di discretizzazione h corrispondenti ai punti del vettore v
h = zeros(size(v));
for i = 1:length(v)
h(i) = ((b-a)/v(i))^2;
end

% Calcolo i valori dei trapezi I1,...,In corrispondenti ai punti del vettore v
j = zeros(size(v));
for i = 1:length(v)
j(i) = formulaTrapezi(f, a, b, v(i));
end

% Calcolo il valore estrapolato p0 tramite l'interpolazione di Newton
p0 = interpolazioneNewton(h, j, 0);

end