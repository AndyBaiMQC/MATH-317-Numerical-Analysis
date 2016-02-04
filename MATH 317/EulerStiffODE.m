f = @(t,y) (y)^2 - 0.03 * (y)^3; %solving the IVP using Euler's method
a = 0; %lower bound of t
T = 20; %upper bound of t
N = 250; %number of iterations
y_0 = 0.1; %initial condition
h = (T-a)/N; %step size
t = a; %inital value of t
w = y_0; %initial value of the approximation
tn = linspace (a, T, N+1); %creating vector for plotting t
yn = zeros(1, N+1); %creating vector for plotting y
yn(1, 1) = w;
for i = 1:N %interating for each interval
    w = w + h*f(t,w);
    t = a + i*h;
    fprintf('w=%.4f t=%.8f\n',t,w);
    yn(1,i+1) = w;
end
plot(tn, yn); %plotting
xlabel('t')
ylabel('y')