A = [2 -1 0;-1 2 -1;0 -1 2];
b = [1 2 3]';
x_ini = [1 0 0]';
error = 10^-10;

n = length(b);
for j = 1 : n
     x(j) = ((b(j) - A(j,[1:j-1,j+1:n]) * x_ini([1:j-1,j+1:n])) / A(j,j)); % the first iteration
end
x1 = x';
k = 1;
while norm(x1-x_ini,1) > error
    for j = 1 : n
     x_ny(j) = ((b(j) - A(j,[1:j-1,j+1:n]) * x1([1:j-1,j+1:n])) / A(j,j));
    end  
    x_ini = x1;
    x1 = x_ny';
    k = k + 1;
end
k
x = x1';