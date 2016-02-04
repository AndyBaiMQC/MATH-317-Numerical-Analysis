function [ x_variable,u ] = ShootingMethod(s, N)
%solving by Heun(improved Euler's) method 
f = @(x,y) [y(2), (5*x^2-5*x)*((1+(y(2))^2)^(1.5))]';
x_initial = 0; %initial value of t
a = 0; %initial conditions
T = 1; %end of time interval
h = T/N; %step size
y_initial = [a,s]';
x = x_initial;
y = y_initial;

x_variable = linspace(0,1,N+1)'; %generate array for plotting t
u = zeros(1, N+1)'; %generate array for plotting y1(theta)
u(1,1) = 0; %first element of the array (from I.C.)
u_prime = zeros(1, N+1)'; %generate array for plotting y2(theta prime)
u_prime(1,1) = s; %first element of the array (from I.C.)

for i = 1:N %iterating through every interval
    y = y + h*f(x,y);
    x = x_initial + i*h;
    u(i+1, 1) = y(1);
    u_prime(i+1, 1) = y(2);
end

end

