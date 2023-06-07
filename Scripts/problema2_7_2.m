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
x = A \ b; % soluzione esatta del sistema

x0 = zeros(n,1);
eps = 10.^(-1:-1:-10); % epsilon da -1 a -10

p = [3,3,3]; % partizione

x_J = zeros(n,length(eps));
x_JB = zeros(n,length(eps));
x_GS = zeros(n,length(eps));
k_J = zeros(1,length(eps));
k_JB = zeros(1,length(eps));
k_GS = zeros(1,length(eps));
norm_J = zeros(1,length(eps));
norm_JB = zeros(1,length(eps));
norm_GS = zeros(1,length(eps));

for k = 1:length(eps)
    % soluzione metodo di Jacobi
    [x_J(:,k),k_J(k)] = metodoJacobi(A,b,eps(k),x0,10000);
    % soluzione metodo di Jacobi a blocchi
    [x_JB(:,k),k_JB(k)] = metodoJacobiBlocchi(A,b,eps(k),p,x0,10000);
    % soluzione metodo di Gauss-Seidel
    [x_GS(:,k),k_GS(k)] = metodoGaussSeidel(A,b,eps(k),x0,10000);

    % norme infinito
    norm_J(k) = norm(x_J(:,k)-x,inf);
    norm_JB(k) = norm(x_JB(:,k)-x,inf);
    norm_GS(k) = norm(x_GS(:,k)-x,inf);
end

T = table(x_J,x_JB,x_GS);
T2 = table(eps, k_J,k_JB,k_GS,norm_J,norm_JB,norm_GS);
disp(T);
disp(T2);
