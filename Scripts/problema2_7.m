% Soluzione del sistema Ax=b con il metodo di Jacobi, Jacobi a blocchi [3,3,3] e Gauss-Seidel
% con x0 = 0 e diverse precisioni epsilon

n = 9;
b = (-1).^(1:n)';
I = eye(n);
B = zeros(n);
for i = 1:n
    for j = 1:n
        B(i,j) = sin(i*pi/(n+1))*sin(j*pi/(n+1));
    end
end

A = (n+1)*I - B;
x = A \ b; %soluzione esatta del sistema

x0 = zeros(n,1);
eps = 10^(-9);
p = [3,3,3]; %partizione

%soluzione metodo di Jacobi
[xJ,kJ] = metodoJacobi(A,b,eps,x0,10000);
%soluzione metodo di Jacobi a blocchi
[xJB,kJB] = metodoJacobiBlocchi(A,b,eps,p,x0,10000);
%soluzione metodo di Gauss-Seidel
[xG,kG] = metodoGaussSeidel(A,b,eps,x0,10000);

%norme infinito
normJ = norm(xJ-x,inf);
normJB = norm(xJB-x,inf);
normG = norm(xG-x,inf);

T = table(xJ,xJB,xG);
T2 = table(kJ,kJB,kG,normJ,normJB,normG);
disp(T);
disp(T2);
