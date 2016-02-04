%solving by Heun(improved Euler's) method 
f = @(t,y) [y(2), -sin(y(1))]'; %initializing the system
t_initial = 0; %initial value of t
a = pi/4; %initial conditions
b = 0;
T = 30; %end of time interval
N = 5000; %number of steps
y_initial = [a, b]'; %initial conditions in vector form
h = T/N; %step size
t = t_initial;
y = y_initial;

Time = linspace(0,30,N+1); %generate array for plotting t
y_1 = zeros(1, N+1); %generate array for plotting y1(theta)
y_1(1,1) = a; %first element of the array (from I.C.)
y_2 = zeros(1, N+1); %generate array for plotting y2(theta prime)
y_2(1,1) = b; %first element of the array (from I.C.)
delta_E = zeros(1, N+1); %generate array for plotting energy shift (part C and D)
delta_E(1,1) = b^2/2 - cos(a); %first element of the array (from I.C.)

for i = 1:N %iterating through every interval
    y = y + h*f(t,y);
    t = t_initial + i*h;
    fprintf('t=%.4f y1=%.8f y2=%.8f\n',t,y);
    %adding new elements to arrays
    y_1(1, i+1) = y(1);
    y_2(1, i+1) = y(2);
    delta_E(1, i+1) = [y(2)]^2/2 - cos((y(1)));
end

%plotting 
plot(Time,delta_E); 
plot(Time,y_1); 
plot(y_1,y_2);
