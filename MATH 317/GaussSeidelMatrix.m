A = [2 -1 0; -1 2 -1; 0 -1 2];% coefficients matrix
C = [1 2 3]';% constants vector
n = length(C);
X = [1;0;0];
Error_eval = ones(n,1);
count= 0;
while max(Error_eval) > 1e-10
    count = count + 1;
    Z = X;  % save current values to calculate error later
    for i = 1:n
        j = 1:n; % define an array of the coefficients' elements
        j(i) = [];  % eliminate the unknow's coefficient from the remaining coefficients
        Xtemp = X;  % copy the unknows to a new variable
        Xtemp(i) = [];  % eliminate the unknown under question from the set of values
        X(i) = (C(i) - sum(A(i,j) * Xtemp)) / A(i,i);
    end
    Xfinal(:,count) = X;
    Error_eval = sqrt((X - Z).^2);
end
display(count);
display(X);
