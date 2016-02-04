%initializing function(f) and its jacobian(J) into matrices
%rewrite x and y into x(1) and x(2)
f = @(x)[x(1)^2 + x(2)^2 - 4, x(1) + sin(x(1)*x(2)) - x(2)]';
J = @(x)[2*x(1), 2*x(2); x(2) * cos(x(1)*x(2))+1, x(1) * cos(x(1)*x(2))-1];
x0 = [1.0, 1.0]';            %initial guess
tol = 10^-8;                 %define stopping criterion
count = 0;                   %count iterations needed
error = 1;                   %randomly defined error which will be updated

%loop through until stopping criterion is met or
%a certain number of iterations is reached
 while (error>tol && count < 100)
 xold = x0;                  %update solution
 x0 = x0 - J(x0)\f(x0);      
 error = norm(x0-xold)/norm(x0); %update the error
 count = count + 1;          %update iteration count
 end
 
display(x0);                 %print final solution
display(count);              %print iterations executed


