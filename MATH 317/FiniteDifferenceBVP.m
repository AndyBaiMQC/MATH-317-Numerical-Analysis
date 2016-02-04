function [slope] = FiniteD(r) %input:[slope] = FiniteD(inline(''))
a = 0;
b = 1;
alpha = 1;
beta = 1+exp(1);
step_size = zeros(4,1);
err = zeros(4,1);
for j = 1:4
    n = 6^j;
    h = (b - a) / (n+1);
    step_size(j,1) = log(h);
    A = zeros(n,n);
    A(1,1) = 2 - 2*h*h;
    A(1,2) = -1 + 1.5*h;
    A(n,n) = 2 - 2*h*h;
    A(n,n-1) = -1 - 1.5*h;
    F(1) = h*h*(3-(2*h))+(1+1.5*h)*alpha;
    F(n) = h*h*(3-(2*(1-h)))+(1-1.5*h)*beta;
    x(1) = a + h;
    x(n) = b - h;
    exact_soln = zeros(n,1);
    exact_soln(1,1) = h + exp(h);
    exact_soln(n,1) = exp(1-h) + 1-h;
    x_var = x(1);
    for i = 2 : n-1
        x_var = x_var + h;
        x(i) = x_var;
        A(i,i-1) = -1 - 1.5*h;
        A(i,i) = 2 - 2*h*h;
        A(i,i+1) = -1 + 1.5*h;
        F(i) = h * h * r(x_var);
        exact_soln(i,1) = exp(x_var) + (x_var);   
    end;
    y = A \ F';
    error = log(norm(y - exact_soln));
    err(j,1) = error;
end
%convergence analysis plotting
plot(step_size,err);
slope = (err(4,1)-err(1,1))/(step_size(4)-step_size(1));