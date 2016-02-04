f = @(t,y) (y)^2 - 0.03*(y)^3; %solving the IVP using Euler's method
a = 0; %lower bound of t
y0 = 0.1; %intial value
b = 20; %upper bound of t
h = 0.08; %step size
N = (b-a)/h; %# of steps
tn = linspace (a, b, N+1); %creating vector for plotting t
yn = zeros(1, N+1); %creating vector for plotting y
yn(1, 1) = y0; 
t = a; %initialize t for iterations
w = y0; %initialize y for iterations
for i = 1:N %iterating over each interval
    ynew = fzero (@(ynew) ynew - (w + h/2*(f (t,w) + f (t+h,ynew)) ), w);
    w = ynew;
    t = t + h;
    yn (1,i+1) = w;
    fprintf('w=%.2f t=%.8f\n',t,w) 
end
plot(tn, yn); %plotting
xlabel('t')
ylabel('y')