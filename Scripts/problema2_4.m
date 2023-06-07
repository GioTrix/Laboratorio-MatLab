f = @(x) 1./(x.*log(x)); % definisco la funzione f
a = 2; b = 5; % definisco gli estremi dell'intervallo di integrazione
I = integral(f,a,b); % calcolo l'integrale esatto di f

% calcolo le approssimazioni di I con le formule dei trapezi e di Cavalieri-Simpson per i valori di n richiesti
n_values = [5, 10, 20, 40, 80, 160, 320, 640, 1280, 2560];
I_trapezi = zeros(size(n_values));
I_cavalieri = zeros(size(n_values));

for i = 1:length(n_values)
    n = n_values(i);
    I_trapezi(i) = formulaTrapezi(f,a,b,n);
    I_cavalieri(i) = formulacavalierisimpson(f,a,b,n);
end

% calcolo i relativi errori
error_trapezi = abs(I_trapezi - I);
error_cavalieri = abs(I_cavalieri - I);

format shortG
% costruisco la tabella con i risultati
T = table(n_values', I_trapezi', error_trapezi', I_cavalieri', error_cavalieri', ...
          'VariableNames', {'n', 'I_n', 'I-I_n', 'S_n', 'S-S_n'});
disp(T)