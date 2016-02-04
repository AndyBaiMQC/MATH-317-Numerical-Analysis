A = [2 -1 0; -1 2 -1; 0 -1 2]; %matrix A, can be changed to different ones
b = [1 2 3]';
x_0 = [1 0 0]';
count = 0;
omega = 0.5;
x = x_0;
tol = 10 ^ -10;
err = ones(3,1);
sol = [2.5 4 3.5]';

while err > tol
    x_new = x + omega * (b - A * x);
    x = x_new;
    count = count + 1;
    err = norm(sol - x);
    display(err);
    display(x);
end

display(count);