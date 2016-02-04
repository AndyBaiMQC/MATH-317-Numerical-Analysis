%evaluate f(x) = x^3 - e^-x using fixed point iteration

x0 = 0.5                     %initial guess
tol = 10^-5                  %define stopping criterion
error_ini = 1;               %randomly defined error which will be updated
count = 0;                   %count iterations needed

%loop through until stopping criterion is met
while error_ini > tol        
    x0 = exp(-x0/3);         %rearrage the equation
    error_ini = abs((x0-xold)/x0)*100; %update the error
    xold = x0;               %update the solution
    count = count + 1;       %update iteration count
end

display(x0)                  %print final solution
display(count)               %number of iterations