f = @(x) x.^3+3*x-1-(exp(-x.^2));a=0; b=1;
% f = @(x) cos(x)-x; a=0; b=pi;

x= linspace(a,b,100);
z = fzero(f,[a,b]);
figure(1);
hold on
plot(x,f(x), 'blue');
plot(z,0,'red*');
legend('$f(x)$','$z$','Interpreter','latex');
hold off

epsilon = 10.^(-(1:10));
n = length(epsilon);
approx = zeros(1, n);
K = zeros(1, n);
f_approx = zeros(1, n);

for i = 1:n
    [approx(i), K(i), f_approx(i)] = bisezione(f, a, b, epsilon(i));
end

T = table(approx', K', f_approx', 'VariableNames', {'Approssimazione', 'Iterazione', 'f(Approssimazione)'});
disp(T(1:10, {'Approssimazione','Iterazione', 'f(Approssimazione)'}));