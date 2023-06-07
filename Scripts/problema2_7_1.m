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

%array contenente le epsilon da -1 a -10
epsilons = 10.^(-1:-1:-10);

p = [3,3,3]; %partizione

%preallocazione delle matrici che conterranno i risultati
KJ = zeros(numel(epsilons), 1);
KJB = zeros(numel(epsilons), 1);
KG = zeros(numel(epsilons), 1);
xJ = zeros(n, numel(epsilons));
xJB = zeros(n, numel(epsilons));
xG = zeros(n, numel(epsilons));
normJ = zeros(numel(epsilons), 1);
normJB = zeros(numel(epsilons), 1);
normG = zeros(numel(epsilons), 1);

l=numel(epsilons);

for i = 1:l
    eps = epsilons(i);
    %soluzione metodo di Jacobi
    [xJ(:,i),KJ(i)] = metodoJacobi(A,b,eps,x0,10000);
    %soluzione metodo di Jacobi a blocchi
    [xJB(:,i),KJB(i)] = metodoJacobiBlocchi(A,b,eps,p,x0,10000);
    %soluzione metodo di Gauss-Seidel
    [xG(:,i),KG(i)] = metodoGaussSeidel(A,b,eps,x0,10000);
    %norme infinito
    normJ(i) = norm(xJ(:,i)-x,inf);
    normJB(i) = norm(xJB(:,i)-x,inf);
    normG(i) = norm(xG(:,i)-x,inf);
end


T=table(xJ(l),xJB(l),xG(l));
disp(T);
T2 = table(epsilons',KJ,KJB,KG,normJ,normJB,normG);
disp(T2);