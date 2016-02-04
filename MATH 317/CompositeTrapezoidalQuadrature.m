%Composite Trapezoidal method for f(x) = exp(-x),and error analysis
f = @(x)exp(-x); 
a = 0; %lower bound
b = 1; %upper bound
n = 1; %initial # of steps
A = [];
B = [];

while n < 257; 
    h = (b-a)/n; %stepsize
    sum = 0; %initial sum term of quadrature
    for i = 1:n-1
        x(i) = a + i*h;
        sum = sum + f(x(i)); %computing sum term by incrementation
    end
    integral = h*(f(a) + 2*sum + f(b))/2; %quadrature formula to evaluate the integral
    stpsize = log(h);
    error = abs(1 - exp(-1) - integral);
    log_error = log(abs(1 - exp(-1) - integral));
    fprintf('n=%d h=%.5f integral=%.6f stepsize=%.6f error=%.6f\n',n,h,integral,stpsize,error);
    n = n * 2;  %increment # of step
    newStepSize = log(h);
    newLogError = log(error);
    A(end+1) = newStepSize;
    B(end+1) = newLogError;
end

plot(A,B);
title('log(stepsize) v.s. log(error)');
xlabel('log(h)') % x-axis label
ylabel('log(error)') % y-axis label
