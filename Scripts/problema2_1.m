%Soluzione Problema 1

% nodi di interpolazione
x = [0 1/64 4/64 9/64 16/64 25/64 36/64 49/64 1];

% valori della funzione sui nodi
y = sqrt(x);

% valori di zeta
zeta = (0:20)/20;

% calcolo il polinomio di interpolazione sui nodi
p = interpolazioneNewton(x, y, zeta);

% calcolo le differenze p(zeta_i) - sqrt(zeta_i)
diffs = p - sqrt(zeta);

% stampa a video le differenze calcolate
fprintf('Differenze tra p(zeta_i) e sqrt(zeta_i):\n');
fprintf('%0.8f\n', diffs);

% traccia il grafico di p(x) e sqrt(x)
fplot(@(t) sqrt(t), [0 1], 'b-', 'LineWidth', 2); % grafico sqrt(x) in blu
hold on;
fplot(@(t) interpolazioneNewton(x, y, t), [0 1], 'r-', 'LineWidth', 2); % grafico p(x) in rosso
legend('\surd(x)', 'p(x)');
