%evaluate f(x) = x^3 - e^(-x) using Secant method
syms x;                  %variable x    
func = x^3 - exp(-x);    %function to be evaluated
a = 0;                   %lower bound of interval
b = 1;                   %upper bound of interval
%approximated solution(s) obtained by the following equation
x1 = (a*f(b) - b*f(a))/(f(b) - f(a));
tol = 10^-5;             %define stopping criterion
f = inline(func);
count = 1;               %count iterations needed

%loop through the stopping criterion is satisfied
while abs(f(x1)) > tol
%update the upper/lower bounds of the interval
    a = b;
    b = x1;
    x1 = (a*f(b) - b*f(a))/(f(b) - f(a));
    count = count + 1;   %update iteration count
%break if solution is not found after a certain 
%number of iterations
    if(count == 100)     
        break;
    end
end

display(x1);             %print final solution
display(count);          %print iterations executed