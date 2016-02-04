function [ X,Y] = shootingsecant( tolerance )%[ X,Y ] = shootingsecant( 10^-10 )
N = 100;
k = 2;
s = zeros(1,10)';
s(1,1) = 0;
s(2,1) = 10^-3;
X = zeros(101, 1);
Y = zeros(101, 1);
[x_variable,u] = QDos(s(1,1),N);
n = 1;
y1 = u(N+1,1);
while n<102
    X(n,1) = x_variable(n,1);
    Y(n,1) = u(n,1);
    n = n+1;    
end
[x_variable,u] = QDos(s(2,1),N);
n = 1;
y2 = u(N+1,1);
while n<102
    X(n,2) = x_variable(n,1);
    Y(n,2) = u(n,1);
    n = n+1;    
end
error = u(N+1,1);
while abs(error) > tolerance
    s(k+1,1) = s(k,1) - ((y2)*(s(k,1)-s(k-1,1)))/(y2-y1);
    [x_variable,u] = QDos(s(k+1,1),N);
    i = 1;
    while i<102
        X(i,k) = x_variable(i,1);
        Y(i,k) = u(i,1);
        i = i+1;
    end
    y1 = y2;
    y2 = u(N+1,1);
    error = u(N+1,1);
    k = k+1;
end
fprintf('number of iterations required is = %d\n',k-1);