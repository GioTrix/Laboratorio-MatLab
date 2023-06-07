% Definizione della funzione f(x) = e^x
f = @(x) exp(x);

% Valore esatto dell'integrale di f(x) da 0 a 1
I_exact = exp(1) - 1;
%In alternativa 
% I_exact=integral(f,0,1);

% Valori di epsilon da considerare
epsilon = 10 .^ (-1:-1:-10);

% Inizializzo i vettori per salvare i risultati
n_vec = zeros(size(epsilon));
I_n_vec = zeros(size(epsilon));
error_vec = zeros(size(epsilon));

% Calcolo i valori richiesti per ogni epsilon
for i = 1:length(epsilon)
    n = ceil(sqrt(exp(1)/(12*epsilon(i))));
    n_vec(i) = n;
    I_n = formulaTrapezi(f, 0, 1, n);
    I_n_vec(i) = I_n;
    error_vec(i) = abs(I_exact - I_n);
end

%punto b
% Tabella dei risultati
format long
table(epsilon', n_vec', I_n_vec', I_exact*ones(size(n_vec))', error_vec', 'VariableNames', {'e', 'n(e)', 'I_n', 'I', '|I-I_n|'})

%punto c
% Calcolo I con le formule dei trapezi per i valori richiesti di n
n_values = [2, 4, 8, 16];
I_values = zeros(size(n_values));
error_values = zeros(size(n_values));
for j = 1:length(n_values)
    n = n_values(j);
    I_values(j) = formulaTrapezi(f, 0, 1, n);
    error_values(j) = abs(I_exact - I_values(j));
end


% Errore per i valori di n richiesti
table(n_values', I_values', error_values', 'VariableNames', {'n', 'I_n', '|I-I_n|'})

%punto d
p0 = estrapolazione(f,0,1,n_values);

format shortG
error_names = {'|I-I_2|','|I-I_4|','|I-I_8|','|I-I_16|', '|I-p0|'};
error_values = [error_values, abs(I_exact - p0)];
table(error_values', 'RowNames', error_names)