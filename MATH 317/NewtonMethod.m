%evaluate f(x) = x^3 - e^(-x) using Newton's method
syms x;                       %variable x
func = x^3 - exp(-x);         %function to be evaluated
dfunc = 3 * x^2 + exp(-x);    %derivative of the function to be evaluated
a = 0;                        %lower bound of interval
b = 1;                        %upper bound of interval
x0 = 0.5;                     %inital guess
tol = 10^-5;                  %define stopping criterion
f = inline(func);
df = inline(dfunc);
count = 1;                    %count iterations needed

%loop through until a relatively large number of 
%iterations is reached
while count < 100           
    p = x0 - f(x0)/df(x0);
    if abs(p - x0) < tol      %break if stopping criterion is met
        display(p);
        break,
    end
    count = count + 1;        %update iteration count
    x0 = p;                   %update solution
end

display(p);                   %print final solution
display(count);               %print iterations executed

