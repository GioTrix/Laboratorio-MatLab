% Definizione della funzione f(x)
f = @(x) x.^2 .* exp(-x);

%punto a
% Valore esatto dell'integrale di f(x) da 0 a 1
syms x;
I_exact=int(x^2*exp(-x),0,1);
disp(I_exact);

%punto b
% Calcolo I con le formule dei trapezi per i valori richiesti di n
n_values = [5, 10, 20, 40,3203844];
I_values = zeros(size(n_values));
error_values = zeros(size(n_values));
for j = 1:length(n_values)
    n = n_values(j);
    I_values(j) = formulaTrapezi(f, 0, 1, n);
    error_values(j) = abs(I_exact - I_values(j));
    disp(I_values(j));
end


%punto c
p0 = estrapolazione(f,0,1,n_values);

format long
disp(p0)

%punto d
format long
error_names = {'|I-I_5|','|I-I_10|','|I-I_20|','|I-I_40|', '|I_3203844|' '|I-p0|'};
error_values = [error_values, abs(I_exact - p0)];
table(error_values', 'RowNames', error_names)

epsy=abs(p0-I_exact);
disp(epsy);

%punto e
f2=diff(f,x,2);
%grafico di |f''(x)|
fplot(abs(f2), [0 1], 'b-', 'LineWidth', 2);
legend("$|f''(x)|$","Interpreter","latex");