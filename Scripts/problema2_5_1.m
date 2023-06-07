A = [5,1,2;-1,7,1;0,1,-3];
b = [13;16;7];
x = [2;3;1];
x0 = [0;0;0];
epsilon = 1e-6;
Nmax = 1000;

x_jacobi = x0;
S = [x_jacobi];

for i = 1:10
    x_jacobi_new = zeros(3,1);
    for j = 1:3
        x_jacobi_new(j) = (b(j) - A(j,:)*x_jacobi)/A(j,j);
    end
    x_jacobi = x_jacobi_new;
    S = [S x_jacobi];
end

S = [S x];

disp(S);
