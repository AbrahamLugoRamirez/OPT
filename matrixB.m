function X = matrixB(n,i)
R = randi(i,1,n);
S = sparse((1:n),(1:n),R(1:n),n,n); %Center
R = randi(i,1,n);
D = sparse(2:n,1:n-1,R(1:n-1),n,n);  %Down
R = randi(i,1,n);
U = sparse(1:n-1,2:n,R(1:n-1),n,n);  %Up
X = S+D+U;
end