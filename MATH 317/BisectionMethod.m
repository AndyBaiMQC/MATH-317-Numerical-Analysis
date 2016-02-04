%evaluate f(x) = x^3 - e^(-x) using Secant method
syms x;                  %variable x
func=x^3 - exp(-x);      %function to be evaluated
a=0;                     %lower bound of interval
b=1;                     %upper bound of interval
tol=10^-10;              %define stopping criterion
f=inline(func);
count=0;                 %count iterations needed
%loop through until a relatively large number of 
%iterations is reached
for i=2:100             
    x1=(b+a)/2;
    count = count + 1;   %update iteration count
%switch lower/upper bounds if the signs of functions differ
    if f(b)*f(x1)<0
        a=x1;
    else
        b=x1;
    end
    if f(a)*f(x1)<0
        b=x1;
    else
        a=x1;
    end
%update lower/upper bounds of interval
    x_new(1)=0;
    x_new(i)=x1;
%break if stopping criterion is met
    if abs((x_new(i)-x_new(i-1))/x_new(i))<tol
        break;
    end
end
display(x1);             %print final solution
display(count);          %print iterations executed