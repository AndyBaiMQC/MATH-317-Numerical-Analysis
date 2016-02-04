function SORmethod(A, b, N) %A*x=b

n = size(A,1);
D = diag(diag(A));
L = tril(-A,-1);
U = triu(-A,1);

Theta = 1.2
Tw = inv(D-Theta*L)*((1-Theta)*D+Theta*U);	%SOR iteration matrix	
cw = Theta*inv(D-Theta*L)*b;			%constant vector needed for iterations

tol = 1e-10;
k = 1;
x = [1 0 0]';                 %starting vector

while k <= N
   x(:,k+1) = Tw*x(:,k) + cw;
   if norm(x(:,k+1)-x(:,k)) < tol
      disp('Number of iteration needed is:')
      disp(k); disp('x = ');disp(x(:,k+1));
      break
   end
   k = k+1;
end