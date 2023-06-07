%n contiene gli ordini delle matrici
n = [5,10,20];

%A è una matrice quadrata di ordine massimo in n, quindi è A(n(end))
A = zeros(n(end));
for i = 1:n(end)
     for j = 1:n(end)
         if i == j
             A(i,j) = 3;
         else
             A(i,j) = -1/2^(max(i,j)-1);
         end
     end
end

%funzione per estrarre la sottomatrice di ordine n da A e il vettore b corrispondente
An = @(n) A(1:n,1:n);
bn = @(n) ones(n,1);

%per ogni valore in n, si estrae la sottomatrice di A corrispondente
%e il vettore b corrispondente
A5 = An(n(1));
b5 = bn(n(1));
A10 = An(n(2));
b10 = bn(n(2));
A20 = An(n(3));
b20 = bn(n(3));

%si risolvono i sistemi lineari con il metodo di backslash
x5 = A5\b5;
x10 = A10\b10;
x20 = A20\b20;

%si stampano i risultati
disp(x5);
disp(x10);
disp(x20);

%Soglia di precisione
epsilon = 10^(-7);

% si inizializzano i vettori di innesco
x05 = zeros(n(1),1);
x010 = zeros(n(2),1);
x020 = zeros(n(3),1);


% si calcolano le soluzioni e il numero di iterazioni richieste
[x_J5,k_J5,rnorm_J_5] = metodoJacobi(A5,b5,epsilon,x05,10000);
[x_J10,k_J10,rnorm_J_10] = metodoJacobi(A10,b10,epsilon,x010,10000);
[x_J20,k_J20,rnorm_J_20] = metodoJacobi(A20,b20,epsilon,x020,10000);


[x_GS5,k_GS5,rnorm_GS_5] = metodoGaussSeidel(A5,b5,epsilon,x05,10000);
[x_GS10,k_GS10,rnorm_GS_10] = metodoGaussSeidel(A10,b10,epsilon,x010,10000);
[x_GS20,k_GS20,rnorm_GS_20] = metodoGaussSeidel(A20,b20,epsilon,x020,10000);

% si stampano i risultati
disp('iterazioni jacobi n = 5')
disp(x_J5);
disp('iterazioni jacobi n = 10')
disp(x_J10);
disp('iterazioni jacobi n = 20')
disp(x_J20);

disp('iterazioni G-S n = 5')
disp(x_GS5);
disp('iterazioni G-S n = 10')
disp(x_GS10);
disp('iterazioni G-S n = 20')
disp(x_GS20);

%Norme infinito metodo di Jacobi
disp('norma infinito jacobi n = 5')
nJ5=norm(x_J5-x5,"inf");
disp(nJ5);
disp('norma infinito jacobi n = 10')
nJ10=norm(x_J10-x10,"inf");
disp(nJ10);
disp('norma infinito jacobi n = 20')
nJ20=norm(x_J20-x20,"inf");
disp(nJ20);

%Norme infinito metodo di Gauss-Seidel
disp('norma infinito g-s n = 5')
nGS5=norm(x_GS5-x5,"inf");
disp(nGS5);
disp('norma infinito g-s n = 10')
nGS10=norm(x_GS10-x10,"inf");
disp(nGS10);
disp('norma infinito g-s n = 20')
nGS20=norm(x_GS20-x20,"inf");
disp(nGS20);